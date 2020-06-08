//
//  TimerTest.m
//  OCTestDemo
//
//  Created by 刘洋 on 2020/6/8.
//  Copyright © 2020 佳缘. All rights reserved.
//

#import "TimerTest.h"
#import "NSTimer+FLEX.h"
#import "NSTimer+JYBlock.h"
#import "NSTimer+Proxy.h"

@interface TimerTest ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation TimerTest

- (void)testTimer {
//    [self testProxyTimer];
    [self testFlexTimer];
//    [self testJYTimer];
}

- (void)testFlexTimer {
    __weak typeof(self)weakself = self;
    self.timer = [NSTimer fireSecondsFromNow:2 block:^{
        __strong typeof(weakself)self = weakself;
        [self timerAction];
    }];
}

- (void)testProxyTimer {
    self.timer = [NSTimer proxy_scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:@{} repeats:YES];
}

- (void)testJYTimer {
     __weak typeof(self)weakself = self;
    self.timer = [NSTimer jy_scheduleTimerWithTimeInterval:1 repeats:YES usingBlock:^(NSTimer * _Nonnull timer) {
        __strong typeof(weakself)self = weakself;
        [self timerAction];
    }];
}

- (void)timerAction {
    NSLog(@"------------");
}

- (void)dealloc
{
    NSLog(@"TimerTest --dealoc");
}

@end
