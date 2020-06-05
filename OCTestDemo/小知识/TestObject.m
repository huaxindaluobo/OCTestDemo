//
//  TestObject.m
//  OCTestDemo
//
//  Created by 刘洋 on 2020/6/4.
//  Copyright © 2020 佳缘. All rights reserved.
//

#import "TestObject.h"
#import <objc/runtime.h>

@protocol TestProtocol <NSObject>

- (void)protocolMethod1;

@end

@interface TestObject ()<TestProtocol>

@property (nonatomic, weak) id<TestProtocol> delegate;

@end

@implementation TestObject

-(void)test {
    self.delegate = self;
//    [self protocolTest];
    [self stringTest];
}

-(void)protocolTest {
    /*
     respondsToSelector表示self.delegate是否实现了对应的方法，实现了就返回YES，否则返回NO，
     与是否遵循协议 无关
     */
    if ([self.delegate respondsToSelector:@selector(protocolMethod1)]) {
        NSLog(@"respondsToSelector");
    }
    
    /*
     conformsToProtocol 表示必须显式的遵循协议，否则即使实现了协议的方法也返回NO
     只要遵循了协议即使没有实现对应的方法，也会返回YES
     */
    if ([self conformsToProtocol:@protocol(TestProtocol)]) {
        NSLog(@"conformsToProtocol");
    }
}


- (void)protocolMethod1 {

}

//nsstring内存相关
- (void)stringTest {
    /*
     一个字符串对象的内存位置是 不一定的。这个具体要看一个 字符串的创建方法与字符串的内容
     str1指向的NSstring对象在堆中，
     str2是一个taggedpoint，字符串的内容就存放在他存放的内存地址中，他存放的内存地址其实是不存在的。taggedpoint用于存放较小的内容，目的是提高内存的利用率与内容的存取效率。str2没有 isa指针。他就存放在栈中。
     str3在常量区，内存地址是在编译阶段是决定了的。
     
     */
    NSString *str1 = [NSString stringWithFormat:@"liuyangliuyangliuyangliuyangliuyangliuyang"];
    NSString *str2 = [NSString stringWithFormat:@"liuyang"];
    NSString *str3 = @"liuyang";
    NSLog(@"内存---%zu%zu%zu",class_getInstanceSize(str1.class),class_getInstanceSize(str2.class),class_getInstanceSize(str3.class));
    NSLog(@"str1:-%p--str2:%p---str3:%p",str1,str2,str3);
    /*
     "=="是比较两个对象的内存地址，其实我们可以简单的理解为“==“就是值比较，比较两个比较对象存放的值是不是一样，不论是NSInterger还是对象。
     ”isEqual“是比较两个对象的类型以及内容的值是不是一样
     ”isEqualToString“，是单纯的比较两个字符串的内容是不是一样。
     */
    
    NSLog(@"== %d",str1 == str2);//比较内存z地址
    NSLog(@"%d---->",[str2 isEqual:str3]);
    NSLog(@"%@--isEqualToString:%d",str2,[str2 isEqualToString:str3]);//比较字符串内容
    
    
    /*
     number 同上
     */
    NSNumber * num1 = [NSNumber numberWithInteger:123];
    NSNumber  * num2 = @(1);
    NSString  * num3 = [NSString stringWithFormat:@"%@",@"123"];
    NSLog(@"number=== %d",num1 == num2);
    NSLog(@"number isequalt %d",[num1 isEqual:num2]);
    NSLog(@"number isequalto string %d",[num1 isEqual:num3]);
}



@end
