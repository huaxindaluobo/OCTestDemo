//
//  NSTimer+FLEX.m
//  OCTestDemo
//
//  Created by 刘洋 on 2020/6/8.
//  Copyright © 2020 佳缘. All rights reserved.
//

#import "NSTimer+FLEX.h"


@interface Block : NSObject
//- (void)invoke;
@end

//#pragma clang diagnostic ignored "-Wincomplete-implementation"
@implementation NSTimer (Blocks)

+ (instancetype)fireSecondsFromNow:(NSTimeInterval)delay block:(VoidBlock)block {
    if (@available(iOS 10, *)) {
        return [self scheduledTimerWithTimeInterval:delay repeats:YES block:(id)block];
    } else {
//        https://blog.csdn.net/u011619283/article/details/53139201
        return [self scheduledTimerWithTimeInterval:delay target:block selector:@selector(invoke) userInfo:nil repeats:YES];
    }
}

@end
