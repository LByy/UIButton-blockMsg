//
//  ViewController.m
//  UIButton-blockMsg
//
//  Created by yyt on 2017/1/17.
//  Copyright © 2017年 yyt. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+blockMsg.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc]init];
    [btn setFrame:CGRectMake(0, 0, 100, 100)];
    [btn setCenter:self.view.center];
    [btn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn];
    [btn btnCallActionBlock:^{
        //此处手指刚触碰 并未离开
    } withBlock:^(NSInteger time) {
        /*此处是手指离开时的回调
         实际项目是根据这个time 与300进行对比处理*/
    }];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
