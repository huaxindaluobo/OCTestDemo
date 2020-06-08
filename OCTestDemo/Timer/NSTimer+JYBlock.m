//
//  NSTimer+JYBlock.m
//  OCTestDemo
//
//  Created by 刘洋 on 2020/6/8.
//  Copyright © 2020 佳缘. All rights reserved.
//

#import "NSTimer+JYBlock.h"

@implementation NSTimer (JYBlock)

+ (instancetype)jy_scheduleTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats usingBlock:(void (^)(NSTimer *timer))block
{
    return [self jy_scheduleTimerWithTimeInterval:seconds repeats:repeats usingBlock:block fire:NO];
}

+ (instancetype)jy_scheduleTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats usingBlock:(void (^)(NSTimer *timer))block fire:(BOOL)fire {
    NSTimer *timer = [self jy_timerWithTimeInterval:seconds repeats:repeats usingBlock:block fire:fire];
    [NSRunLoop.currentRunLoop addTimer:timer forMode:NSRunLoopCommonModes];
    return timer;
}

+ (instancetype)jy_timerWithTimeInterval:(NSTimeInterval)inSeconds repeats:(BOOL)repeats usingBlock:(void (^)(NSTimer *timer))block fire:(BOOL)fire
{
    NSParameterAssert(block != nil);
    CFAbsoluteTime seconds = fmax(inSeconds, 0.0001);
    CFAbsoluteTime interval = repeats ? seconds : 0;
    CFAbsoluteTime fireDate = CFAbsoluteTimeGetCurrent() + (fire ? 0.0001 : seconds);
    return (__bridge_transfer NSTimer *)CFRunLoopTimerCreateWithHandler(NULL, fireDate, interval, 0, 0, (void(^)(CFRunLoopTimerRef))block);
}

@end
