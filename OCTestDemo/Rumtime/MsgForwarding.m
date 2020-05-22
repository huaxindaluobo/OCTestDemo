//
//  MsgForwarding.m
//  OCTestDemo
//
//  Created by 刘洋 on 2020/5/21.
//  Copyright © 2020 佳缘. All rights reserved.
//

#import "MsgForwarding.h"
#import <objc/runtime.h>

@interface MsgReplaceClass : NSObject



@end


@implementation MsgReplaceClass

- (void)TestNSLog {
    NSLog(@"target转发成功");
}

@end



@implementation MsgForwarding{
    MsgReplaceClass * replace ;
}


void resoloveMsg(id self,SEL _cmd) {
    NSLog(@"解决bug");
}
//1
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    unsigned int count;
   Method * methods = class_copyMethodList([self class], &count);
    for (int i=0; i<count; i++) {
        Method item = methods[i];
        SEL methodSel = method_getName(item);
        NSLog(@"==========%@",NSStringFromSelector(methodSel));
    }

    class_addMethod([self class], sel, (IMP)resoloveMsg, "v@:");

    methods = class_copyMethodList([self class], &count);
    for (int i=0; i<count; i++) {
        Method item = methods[i];
        SEL methodSel = method_getName(item);
        NSLog(@"==========%@===========",NSStringFromSelector(methodSel));
    }
    return YES;
}
//2
- (id)forwardingTargetForSelector:(SEL)aSelector {
    MsgReplaceClass * replace = [MsgReplaceClass alloc];
    if ([replace respondsToSelector:aSelector]) {
        return  replace;
    }
    return [super forwardingTargetForSelector:aSelector];
}
//3.2
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if ([replace respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:[MsgReplaceClass alloc]];
    }else{
        [super forwardInvocation:anInvocation];
    }
}
//3.1
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    replace = [MsgReplaceClass alloc];
    if ([replace respondsToSelector:aSelector]) {
    return[replace methodSignatureForSelector:aSelector];
    }
    return [super methodSignatureForSelector:aSelector];
}


@end
