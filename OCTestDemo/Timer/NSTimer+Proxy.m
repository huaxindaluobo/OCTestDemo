//
//  NSTimer+Proxy.m
//  OCTestDemo
//
//  Created by 刘洋 on 2020/6/8.
//  Copyright © 2020 佳缘. All rights reserved.
//

#import "NSTimer+Proxy.h"
#import "TimerProxy.h"

@implementation NSTimer (Proxy)

+ (NSTimer *)proxy_scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo {
    TimerProxy * proxy = [[TimerProxy alloc]initWithTarge:aTarget];
    return [self scheduledTimerWithTimeInterval:ti target:proxy selector:aSelector userInfo:userInfo repeats:yesOrNo];
}

@end
