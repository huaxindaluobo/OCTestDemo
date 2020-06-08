//
//  ViewController.m
//  OCTestDemo
//
//  Created by 刘洋 on 2020/5/21.
//  Copyright © 2020 佳缘. All rights reserved.
//

#import "ViewController.h"
#import "TargetProxy.h"
#import "JSDistProxy.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "TimerProxy.h"
#import "MsgForwarding.h"
#import "TestObject.h"
#import "TimerTest.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) TimerTest * timerTest;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSString *> *dataSource;

@end

static NSString * cellIdentify = @"cellIdentify";

@implementation ViewController{
    dispatch_queue_t queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =  @"测试项目";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 66;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentify];
    [self.view addSubview:self.tableView];
}

#pragma mark - 小知识点测试
- (void)test {
    [[TestObject alloc] test];
}


#pragma mark - 多线程
- (void)testMultiThread {
    NSLog(@"11111");
    NSLog(@"3333%@",[NSThread  currentThread]);
    dispatch_async(queue, ^{
        NSLog(@"%@",[NSThread  currentThread]);
    });
}

#pragma mark - runtime--消息转发
- (void)testMsgForwarding {
    MsgForwarding * msg = [MsgForwarding alloc];
    [msg TestNSLog];
}

#pragma mark  - 代理类
- (void)testProxy {
        /*
         TargetProxy拥有了NSSting与NSArray俩个类的方法属性
         */
        NSMutableArray *array = [NSMutableArray array];
         NSMutableString *string = [NSMutableString string];
    
         id proxy = [[TargetProxy alloc]initWithTarget1:array target:string];
         [proxy appendString:@"This "];
    
         [proxy appendString:@"is "];
         [proxy addObject:string];
         [proxy appendString:@"a "];
         [proxy appendString:@"test!"];
          NSLog(@"count should be 1,it is:%ld",[proxy count]);
         if ([[proxy objectAtIndex:0] isEqualToString:@"This is a test!"]) {
             NSLog(@"Appending successful: %@",proxy);
         }else
         {
             NSLog(@"Appending failed, got: %@", proxy);
         }
             NSLog(@"Example finished without errors.");
    
        
        /*
         实现方法的实现与声明分离，提升项目代码的可维护性，更加模块化。
         */
//        JSDistProxy *proxy = [JSDistProxy sharedInstance];
//         Teacher *teacher = [Teacher new];
//         Student *student = [Student new];
//         [proxy registerMethodWithTarget:teacher];
//         [proxy registerMethodWithTarget:student];
//
//         [proxy beginLearning];
//        objc_msgSend(proxy,NSSelectorFromString(@"test"));
//         [proxy beginTeachering];
//
       
}

- (void)testTimer {
    self.timerTest = [[TimerTest alloc]init];
    [self.timerTest testTimer];
}

- (void)timerAction {
    NSLog(@"------------");
}

#pragma mark - tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            [self testProxy];
        }
            break;
            
        
        case 1:
        {
            [self testMultiThread];
        }
            break;
            
        
        case 2:
        {
            [self testMsgForwarding];
        }
            break;
            
        case 3:
        {
            [self testTimer];
        }
            break;
            
            
        default:
            break;
    }
}

#pragma mark - 懒加载
- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"代理类测试",@"多线程",@"消息转发",@"NSTimer相关"];
    }
    return _dataSource;
}

@end
