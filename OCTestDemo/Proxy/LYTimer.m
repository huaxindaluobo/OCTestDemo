//
//  LYTimer.m
//  OCTestDemo
//
//  Created by 刘洋 on 2020/5/21.
//  Copyright © 2020 佳缘. All rights reserved.
//

#import "LYTimer.h"
#import "TimerProxy.h"

@implementation LYTimer

+ (LYTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    TimerProxy * proxy = [[TimerProxy alloc]initWithTarge:aTarget];
     return (LYTimer *)[NSTimer scheduledTimerWithTimeInterval:ti target:proxy selector:aSelector userInfo:userInfo repeats:yesOrNo];
}

@end
