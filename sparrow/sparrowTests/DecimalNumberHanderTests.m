//
//  DecimalNumberHanderTests.m
//  sparrow
//
//  Created by microsparrow on 16/2/15.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DecimalNumberHander.h"

@interface DecimalNumberHanderTests : XCTestCase

@property   (nonatomic,strong)  DecimalNumberHander *hander;

@end

@implementation DecimalNumberHanderTests

- (void)setUp {
    [super setUp];
    
    self.hander = [[DecimalNumberHander alloc] init];
}

- (void)tearDown {
    [super tearDown];
    
    self.hander = nil;
}

- (void)testDecimalHander {
    [self.hander decimalHander];
}

- (void)testCompareDecimalNumber {
    [self measureBlock:^{
        [self.hander compareDecimalNumber];
    }];
}

- (void)testMultiplying {
    
}

- (void)testPerformanceExample {
    [self measureBlock:^{
        
    }];
}

@end
