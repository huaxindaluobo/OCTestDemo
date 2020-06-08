//
//  OCTestDemoTests.m
//  OCTestDemoTests
//
//  Created by 刘洋 on 2020/5/21.
//  Copyright © 2020 佳缘. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TimerTest.h"

@interface OCTestDemoTests : XCTestCase

@property (nonatomic, strong) TimerTest *timerTest;

@end

@implementation OCTestDemoTests

- (void)setUp {
    self.timerTest = [[TimerTest alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    [self.timerTest testTimer];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
