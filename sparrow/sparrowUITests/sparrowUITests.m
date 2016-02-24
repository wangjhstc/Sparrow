//
//  sparrowUITests.m
//  sparrowUITests
//
//  Created by microsparrow on 16/1/25.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface sparrowUITests : XCTestCase

@end

@implementation sparrowUITests

- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;

    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
    
}

- (void)testExample {
    
//    [[[XCUIApplication alloc] init].buttons[@"touch"] tap];
//    XCUIApplication *app = [[XCUIApplication alloc] init];
//    XCUIElement *touchButton = app.buttons[@"touch"];
//    [touchButton tap];
//    
//    XCUIElement *backButton = [[[app.navigationBars[@"Second"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementAtIndex:0];
//    [backButton tap];
//    [touchButton tap];
//    [backButton tap];
}

@end
