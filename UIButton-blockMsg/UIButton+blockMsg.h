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

@property (nonatomic,copy)NSString * pressedTime;
@property (nonatomic,copy)NSString * unpressedTime;

- (void)btnCallActionBlock:(pressedBlock)pressblock withBlock:(unpressedBlock)unpressedblock;

@end
