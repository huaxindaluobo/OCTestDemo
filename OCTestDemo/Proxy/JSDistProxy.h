//
//  JSDistProxy.h
//  OCTestDemo
//
//  Created by 刘洋 on 2020/5/21.
//  Copyright © 2020 佳缘. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TeacherProtocol <NSObject>
- (void)beginTeachering;
@end

@interface Teacher : NSObject

- (void)test;

@end




@protocol StudentProtocol <NSObject>
 - (void)beginLearning;
@end


@interface Student : NSObject

@end




@interface JSDistProxy : NSProxy<TeacherProtocol,StudentProtocol>
+(instancetype)sharedInstance;
-(void)registerMethodWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
