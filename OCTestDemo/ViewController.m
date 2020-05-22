//
//  ViewController.m
//  OCTestDemo
//
//  Created by 刘洋 on 2020/5/21.
//  Copyright © 2020 佳缘. All rights reserved.
//

#import "ViewController.h"
#import "TargetProxy.h"
#import "JSDistProxy.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "TimerProxy.h"
#import "LYTimer.h"
#import "MsgForwarding.h"
@interface ViewController ()

@property (nonatomic, strong) LYTimer * timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self testMsgForwarding];

}

- (void)testMsgForwarding {
    MsgForwarding * msg = [MsgForwarding alloc];
    [msg TestNSLog];
}

- (void)testProxy {
        /*
         TargetProxy拥有了NSSting与NSArray俩个类的方法属性
         */
    //    NSMutableArray *array = [NSMutableArray array];
    //     NSMutableString *string = [NSMutableString string];
    //
    //     id proxy = [[TargetProxy alloc]initWithTarget1:array target:string];
    //     [proxy appendString:@"This "];
    //
    //     [proxy appendString:@"is "];
    //     [proxy addObject:string];
    //     [proxy appendString:@"a "];
    //     [proxy appendString:@"test!"];
    //      NSLog(@"count should be 1,it is:%ld",[proxy count]);
    //     if ([[proxy objectAtIndex:0] isEqualToString:@"This is a test!"]) {
    //         NSLog(@"Appending successful: %@",proxy);
    //     }else
    //     {
    //         NSLog(@"Appending failed, got: %@", proxy);
    //     }
    //         NSLog(@"Example finished without errors.");
    //
        
        /*
         //实现方法的实现与声明分离，提升项目代码的可维护性，更加模块化。
         */
    //    JSDistProxy *proxy = [JSDistProxy sharedInstance];
    //     Teacher *teacher = [Teacher new];
    //     Student *student = [Student new];
    //     [proxy registerMethodWithTarget:teacher];
    //     [proxy registerMethodWithTarget:student];
    //
    //     [proxy beginLearning];
    //    objc_msgSend(proxy,NSSelectorFromString(@"test"));
    //     [proxy beginTeachering];
        
        /*
         timer相关
         */
        
    //    self.timer = [NSTimer timerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
    //        NSLog(@"----------------");
    //    }];
    //    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    //    [self.timer fire];
        
    //    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
    //        NSLog(@"----------------");
    //    }];
       /*
        通过代理类解决Timer循环引用
        */
    //    self.timer = [LYTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}

- (void)timerAction {
    NSLog(@"------------");
}

@end
