//
//  LoadDataHelperTests.m
//  sparrow
//
//  Created by microsparrow on 16/2/18.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LoadDataHelper.h"

@interface LoadDataHelperTests : XCTestCase

@property   (nonatomic,strong)  NSArray *array;

@property   (nonatomic,strong)  LoadDataHelper  *loadDataHelper;

@end

@implementation LoadDataHelperTests

- (void)setUp {
    [super setUp];
    self.loadDataHelper = [LoadDataHelper shareInstance];
    self.array = self.loadDataHelper.dataArray;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSetValueWithKey {
    [self measureBlock:^{
        [self.loadDataHelper setValueWithKey:self.array];
    }];
}

- (void)testSetValueWithForIN {
    [self measureBlock:^{
        [self.loadDataHelper setValueWithForIN:self.array];
    }];
}

- (void)testSetValueWithGCD {
    
//    NSLog(@"1111    :   %@",((LoadDataModel *)self.array[100000]).isChange ? @"YES" : @"NO");
//    NSLog(@"1111    :   %@",((LoadDataModel *)self.array[300000]).isChange ? @"YES" : @"NO");
//    NSLog(@"1111    :   %@",((LoadDataModel *)self.array[500000]).isChange ? @"YES" : @"NO");
//    NSLog(@"1111    :   %@",((LoadDataModel *)self.array[700000]).isChange ? @"YES" : @"NO");
//    NSLog(@"1111    :   %@",((LoadDataModel *)self.array[900000]).isChange ? @"YES" : @"NO");
    
    [self measureBlock:^{
        [self.loadDataHelper setValueWithGCD:self.array];
    }];
    
//    NSLog(@"2222    :   %@",((LoadDataModel *)self.array[100000]).isChange ? @"YES" : @"NO");
//    NSLog(@"2222    :   %@",((LoadDataModel *)self.array[300000]).isChange ? @"YES" : @"NO");
//    NSLog(@"2222    :   %@",((LoadDataModel *)self.array[500000]).isChange ? @"YES" : @"NO");
//    NSLog(@"2222    :   %@",((LoadDataModel *)self.array[700000]).isChange ? @"YES" : @"NO");
//    NSLog(@"2222    :   %@",((LoadDataModel *)self.array[900000]).isChange ? @"YES" : @"NO");
}


- (void)testDispatch {
    
//    __weak __typeof(self)weakSelf = self;
    
    dispatch_queue_t queue = dispatch_queue_create("com.sparrowkit.dispatch", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        
//        __strong __typeof(weakSelf) strongSelf = weakSelf;
        
        while (YES) {
            NSLog(@"xxx");
        }
    });
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
#if !OS_OBJECT_USE_OBJC
        dispatch_suspend(queue);
        dispatch_release(queue);
#else
        dispatch_suspend(queue);
#endif
        
    });
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_resume(queue);
    });
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(20 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_suspend(queue);
    });
    
    
}

















@end
