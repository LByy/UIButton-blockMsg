//
//  UIButton+blockMsg.m
//  ZigeRobot
//
//  Created by yyt on 2017/1/17.
//  Copyright © 2017年 com.zige.robot. All rights reserved.
//

#import "UIButton+blockMsg.h"

#define selfScale 0.8    //缩小比率 0-1之间
#define selfAnimateTime 2.0   //缩小动画执行时间

@implementation UIButton (blockMsg)

static char pressedKey;
static char unpressedKey;
static char pressedTimeKey;
static char unpressedTimeKey;


- (void)btnCallActionBlock:(pressedBlock)pressblock withBlock:(unpressedBlock)unpressedblock{
    
     objc_setAssociatedObject(self, &pressedKey, pressblock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self, &unpressedKey, unpressedblock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    //手指刚点击按钮
    [self addTarget:self action:@selector(pressedEvent:) forControlEvents:UIControlEventTouchDown];

    //手指离开按钮
    [self addTarget:self
             action:@selector(pressedEndEvent:)
   forControlEvents:UIControlEventTouchUpInside];
    
}

//按钮的按下事件
- (void)pressedEvent:(id)sender
{
    pressedBlock block = (pressedBlock)objc_getAssociatedObject(self, &pressedKey);
    if (block) {
        block();
    }
    self.pressedTime = [self getTime];
    NSLog(@"点击时间%@",self.pressedTime);
    
    //执行点动效果(缩小)
    [UIView animateWithDuration:selfAnimateTime animations:^{
        self.transform = CGAffineTransformMakeScale(selfScale, selfScale);
    } completion:^(BOOL finished) {
        //此处是当按钮的缩小动画做完之后可以进行后续的操作 根据自身业务调节
    }];
}
//按钮的松开事件
- (void)pressedEndEvent:(id)sender
{
    self.unpressedTime = [self getTime];
    NSLog(@"松开时间%@",self.unpressedTime);
    
    NSInteger blocktime = ([self.unpressedTime integerValue]-[self.pressedTime integerValue]);
    
    unpressedBlock block = (unpressedBlock)objc_getAssociatedObject(self, &unpressedKey);
    if (block) {
        block(blocktime);
    }
    
    //执行点动效果(放大)
    [UIView animateWithDuration:selfAnimateTime animations:^{
         self.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
        //此处是当按钮的放大动画做完之后可以进行后续的操作 根据自身业务调节
    }];
 
}

- (void)setPressedTime:(NSString *)pressedTime{
    objc_setAssociatedObject(self, &pressedTimeKey, pressedTime, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (NSString*)pressedTime{
    
    return objc_getAssociatedObject(self, &pressedTimeKey);
}


- (void)setUnpressedTime:(NSString *)unpressedTime{
    
    objc_setAssociatedObject(self, &unpressedTimeKey, unpressedTime, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (NSString*)unpressedTime{
    return objc_getAssociatedObject(self, &unpressedTimeKey);
}


-(NSString *)getTime
{
    NSDate *date = [[NSDate alloc] init];
    NSTimeInterval _timeInt = [date timeIntervalSince1970]*1000.0f;
    NSString *timeStr = [NSString stringWithFormat:@"%f",_timeInt];
    return timeStr;
}


@end
