//
//  UIButton+blockMsg.h
//  ZigeRobot
//
//  Created by yyt on 2017/1/17.
//  Copyright © 2017年 com.zige.robot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void (^pressedBlock)();
typedef void (^unpressedBlock)(NSInteger time);

@interface UIButton (blockMsg)

/**
 手指刚触摸的时间
 */
@property (nonatomic,copy)NSString * pressedTime;

/**
 手指离开屏幕的时间
 */
@property (nonatomic,copy)NSString * unpressedTime;

/**
 按钮的回调

 @param pressblock      手指刚触摸的回调
 @param unpressedblock  手指离开屏幕的回调
 */
- (void)btnCallActionBlock:(pressedBlock)pressblock withBlock:(unpressedBlock)unpressedblock;


@end
