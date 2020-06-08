//
//  NSTimer+JYBlock.h
//  OCTestDemo
//
//  Created by 刘洋 on 2020/6/8.
//  Copyright © 2020 佳缘. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (JYBlock)

/** Creates a new @c NSTimer object using the specified handler, schedules it on
 * the current run loop, and returns it.
 *
 * @param seconds For a repeating timer, the seconds between firings of the
 * timer. If seconds is less than or equal to @c 0.0, @c 0.1 is used instead.
 * @param repeats If @c YES, the timer will repeatedly reschedule itself until
 * invalidated. If @c NO, the timer will be invalidated after it fires.
 * @param block The code unit to execute when the timer fires.
 * @return A new @c NSTimer object, configured according to the specified parameters.
 */
+ (instancetype)jy_scheduleTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats usingBlock:(void (^)(NSTimer *timer))block;

/**
 * @param fire If @c YES, fires the timer immediately.
 */
+ (instancetype)jy_scheduleTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats usingBlock:(void (^)(NSTimer *timer))block fire:(BOOL)fire;

@end

NS_ASSUME_NONNULL_END
