//
//  TargetProxy.m
//  OCTestDemo
//
//  Created by 刘洋 on 2020/5/21.
//  Copyright © 2020 佳缘. All rights reserved.
//

#import "TargetProxy.h"

@implementation TargetProxy

-(id)initWithTarget1:(id)t1 target:(id)t2
 {
       realObject1 = t1;
       realObject2 = t2;
       return self;
 }
 -(void)forwardInvocation:(NSInvocation *)invocation
 {
    id target = [realObject1 methodSignatureForSelector:invocation.selector]?realObject1:realObject2;
    [invocation invokeWithTarget:target];
 }
 -(NSMethodSignature *)methodSignatureForSelector:(SEL)sel
 {
    NSMethodSignature *signature;
    signature = [realObject1 methodSignatureForSelector:sel];
    if (signature) {
       return signature;
    }
    signature = [realObject2 methodSignatureForSelector:sel];
    return signature;
 }
// -(BOOL)respondsToSelector:(SEL)aSelector
// {
//  if ([realObject1 respondsToSelector:aSelector]) {
//     return YES;
//  }
//  if ([realObject2 respondsToSelector:aSelector]) {
//     return YES;
//   }
// return NO;
// }

@end
