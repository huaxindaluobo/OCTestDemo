//
//  LYTimer.h
//  OCTestDemo
//
//  Created by 刘洋 on 2020/5/21.
//  Copyright © 2020 佳缘. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYTimer : NSTimer

+ (LYTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

@end

NS_ASSUME_NONNULL_END
