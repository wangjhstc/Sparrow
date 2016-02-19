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

@end
