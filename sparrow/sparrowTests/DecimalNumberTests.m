//
//  DecimalNumberTests.m
//  sparrow
//
//  Created by microsparrow on 16/2/15.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DecimalNumber.h"

@interface DecimalNumberTests : XCTestCase

@end

@implementation DecimalNumberTests

- (void)setUp {
    [super setUp];

}

- (void)tearDown {
    [super tearDown];
}

- (void)testMantissa {
    DecimalNumber *number = [[DecimalNumber alloc] init];
    NSDecimalNumber *mantissa = [number mantissa];
    NSLog(@"%@",mantissa);
}

- (void)testAdd {
    DecimalNumber *number = [[DecimalNumber alloc] init];
    NSDecimalNumber *add  = [number add];
    NSLog(@"%@",add);
}

- (void)testMultiplying {
    DecimalNumber *number = [[DecimalNumber alloc] init];
    NSString *value = [number multiplyingWithValue:@"9.999" value2:@"0.001"];
    
//    NSDecimalNumberHandler
//    NSDecimalNumberHandler
    
    NSLog(@"%@",value);
}

- (void)testPerformanceExample {
    [self measureBlock:^{
    }];
}

@end
