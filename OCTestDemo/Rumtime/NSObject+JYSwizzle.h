//
//  NSObject+JYSwizzle.h
//  OCTestDemo
//
//  Created by 刘洋 on 2020/6/8.
//  Copyright © 2020 佳缘. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JYSwizzle)


+ (BOOL)jy_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_;
+ (BOOL)jy_swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError**)error_;


/**
 ```
 __block NSInvocation *invocation = nil;
 invocation = [self jy_swizzleMethod:@selector(initWithCoder:) withBlock:^(id obj, NSCoder *coder) {
 NSLog(@"before %@, coder %@", obj, coder);
 
 [invocation setArgument:&coder atIndex:2];
 [invocation invokeWithTarget:obj];
 
 id ret = nil;
 [invocation getReturnValue:&ret];
 
 NSLog(@"after %@, coder %@", obj, coder);
 
 return ret;
 } error:nil];
 ```
 */
+ (NSInvocation*)jy_swizzleMethod:(SEL)origSel withBlock:(id)block error:(NSError**)error;

/**
 ```
 __block NSInvocation *classInvocation = nil;
 classInvocation = [self jy_swizzleClassMethod:@selector(test) withBlock:^() {
 NSLog(@"before");
 
 [classInvocation invoke];
 
 NSLog(@"after");
 } error:nil];
 ```
 */
+ (NSInvocation*)jy_swizzleClassMethod:(SEL)origSel withBlock:(id)block error:(NSError**)error;


@end

NS_ASSUME_NONNULL_END
