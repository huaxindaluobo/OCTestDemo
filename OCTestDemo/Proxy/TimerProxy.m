//
//  TimerProxy.m
//  OCTestDemo
//
//  Created by 刘洋 on 2020/5/21.
//  Copyright © 2020 佳缘. All rights reserved.
//

#import "TimerProxy.h"

@interface TimerProxy ()

@property (nonatomic, weak) id tatget;

@end

@implementation TimerProxy

- (instancetype)initWithTarge:(id)target {
   
    self.tatget = target;
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    if ([self.tatget methodSignatureForSelector:sel]) {
        return [self.tatget methodSignatureForSelector:sel];
    }
    return [super methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    if ([self.tatget methodSignatureForSelector:invocation.selector]) {
        return [invocation invokeWithTarget:self.tatget];
    }
    [super forwardInvocation:invocation];
}

@end
