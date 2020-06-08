//
//  NSTimer+FLEX.h
//  OCTestDemo
//
//  Created by 刘洋 on 2020/6/8.
//  Copyright © 2020 佳缘. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^VoidBlock)(void);

@interface NSTimer (Blocks)

+ (instancetype)fireSecondsFromNow:(NSTimeInterval)delay block:(VoidBlock)block;

// Forward declaration
//+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

@end

NS_ASSUME_NONNULL_END
