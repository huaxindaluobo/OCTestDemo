//
//  TimerProxy.h
//  OCTestDemo
//
//  Created by 刘洋 on 2020/5/21.
//  Copyright © 2020 佳缘. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimerProxy : NSProxy

- (instancetype)initWithTarge:(id)target;

@end

NS_ASSUME_NONNULL_END
