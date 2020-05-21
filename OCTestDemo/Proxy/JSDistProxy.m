//
//  JSDistProxy.m
//  OCTestDemo
//
//  Created by 刘洋 on 2020/5/21.
//  Copyright © 2020 佳缘. All rights reserved.
//

#import <Foundation/Foundation.h>

 #import "JSDistProxy.h"
 #import <objc/runtime.h>
 
@implementation Teacher

-(void)beginTeachering
{
    NSLog(@"%s",__func__);
}

- (void)test {
    NSLog(@"-----------%s",__func__);
}
@end

@implementation Student

-(void)beginLearning
{
    NSLog(@"%s",__func__);
}


@end

 @interface JSDistProxy ()
 @property(nonatomic,strong) NSMutableDictionary *selectorMapDic;
 @end
 
 
 @implementation JSDistProxy
 
 +(instancetype)sharedInstance
 {
    static JSDistProxy *proxy;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       proxy = [JSDistProxy alloc];
       proxy.selectorMapDic = [NSMutableDictionary dictionary];
    });
     return proxy;
 }
 -(void)registerMethodWithTarget:(id)target
 {
     unsigned int count = 0;
     Method *methodList = class_copyMethodList([target class], &count);
     for (int i=0; i<count; i++) {
          Method method = methodList[i];
          SEL selector = method_getName(method);
          const char *method_name = sel_getName(selector);
         [self.selectorMapDic setValue:target forKey:[NSString stringWithUTF8String:method_name]];
     }
     free(methodList);
 }
 
 -(NSMethodSignature *)methodSignatureForSelector:(SEL)sel
 {
       NSString *methodStr = NSStringFromSelector(sel);
       if ([self.selectorMapDic.allKeys containsObject:methodStr]) {
       id target = self.selectorMapDic[methodStr];
           return [target methodSignatureForSelector:sel];
        }
       return [super methodSignatureForSelector:sel];
 }
 -(void)forwardInvocation:(NSInvocation *)invocation
 {
        NSString *methodName = NSStringFromSelector(invocation.selector);
        if ([self.selectorMapDic.allKeys containsObject:methodName]) {
            id target = self.selectorMapDic[methodName];
            [invocation invokeWithTarget:target];
        }else
        {
            [super forwardInvocation:invocation];
         }
 }

 @end
