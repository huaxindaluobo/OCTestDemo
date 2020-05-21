//
//  TargetProxy.h
//  OCTestDemo
//
//  Created by 刘洋 on 2020/5/21.
//  Copyright © 2020 佳缘. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TargetProxy : NSProxy
{
    id realObject1;
    id realObject2;
}
-(id)initWithTarget1:(id)t1 target:(id)t2;

@end

NS_ASSUME_NONNULL_END
