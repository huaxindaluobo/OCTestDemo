//
//  NSTimer+Proxy.h
//  OCTestDemo
//
//  Created by 刘洋 on 2020/6/8.
//  Copyright © 2020 佳缘. All rights reserved.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (Proxy)

+ (NSTimer *)proxy_scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo;

@end

NS_ASSUME_NONNULL_END
