//
//  DecimalNumberHander.m
//  sparrow
//
//  Created by microsparrow on 16/2/15.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "DecimalNumberHander.h"

typedef enum : NSUInteger {
    CalculateOfAdd,
    CalculateOfSubtract,
    CalculateOfMultiply,
    CalculateOfDivide
} CalculateType;

@interface DecimalNumberHander ()

@property (nonatomic,strong) NSDecimalNumberHandler  *roundPlainHander;

@property (nonatomic,strong) NSDecimalNumberHandler  *roundDownHander;

@property (nonatomic,strong) NSDecimalNumberHandler  *roundUpHander;

@property (nonatomic,strong) NSDecimalNumberHandler  *roundBankersHander;

@end

@implementation NSDecimalNumber (Calculate)

- (NSDecimalNumber *)calculateDecimalNumber:(NSDecimalNumber *)decimalNumber
                              calculateType:(CalculateType)calculateType
                               withBehavior:(id <NSDecimalNumberBehaviors>)behavior {
    return [self decimalNumberByAdding:decimalNumber withBehavior:behavior];
}

@end

@implementation DecimalNumberHander

#pragma mark - 基础单元

- (NSDecimalNumberHandler *)roundPlainHander {
    if (_roundPlainHander == nil) {
        _roundPlainHander =  [self allocHanderWithMode:NSRoundPlain];
    }
    return _roundPlainHander;
}

- (NSDecimalNumberHandler *)roundBankersHander {
    if (_roundBankersHander == nil) {
        _roundBankersHander = [self allocHanderWithMode:NSRoundBankers];
    }
    return _roundBankersHander;
}

- (NSDecimalNumberHandler *)roundDownHander {
    if (_roundDownHander == nil) {
        _roundDownHander = [self allocHanderWithMode:NSRoundDown];
    }
    return _roundDownHander;
}

- (NSDecimalNumberHandler *)roundUpHander {
    if (_roundUpHander == nil) {
        _roundUpHander = [self allocHanderWithMode:NSRoundUp];
    }
    return _roundUpHander;
}

- (NSDecimalNumberHandler *)allocHanderWithMode:(NSRoundingMode)roundingMode {
    NSDecimalNumberHandler *decimalHander   =   [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:roundingMode
                                                                                                       scale:2
                                                                                            raiseOnExactness:NO
                                                                                             raiseOnOverflow:NO
                                                                                            raiseOnUnderflow:NO
                                                                                         raiseOnDivideByZero:YES];
    return decimalHander;
}



#pragma mark - 运算函数

/**
 *  @author wangjianghua, 16-02-16 21:02:08
 *
 *  @brief 求和
 *
 *  @param value value description
 *
 *  @return return value description
 */
- (NSDecimalNumber *)decimalNumberByAdding:(NSString *)value,... {
    NSDecimalNumber *decimalNumber = [NSDecimalNumber zero];
    
    va_list arguments;
    id eachObject;
    
    if (value) {
        va_start(arguments, value);
        while ((eachObject = va_arg(arguments, id))) {
            NSDecimalNumber *eachObjectNumber = [NSDecimalNumber decimalNumberWithString:eachObject];
//            decimalNumber = [decimalNumber decimalNumberByAdding:eachObjectNumber withBehavior:self.roundUpHander];
            decimalNumber = [decimalNumber calculateDecimalNumber:eachObjectNumber calculateType:CalculateOfAdd withBehavior:self.roundUpHander];
        }
        va_end(arguments);
    }
    
    return decimalNumber;
}

- (NSDecimalNumber *)decimalNumberByMultiplying:(NSString *)value,... {
    
    return nil;
}




/*
 - (void) appendObjects:(id) firstObject, ...
 {
 id eachObject;
 va_list
 argumentList;
 if (firstObject)
 {
 [self addObject:
 firstObject];
 va_start(argumentList, firstObject);
 while (eachObject =
 va_arg(argumentList, id))
 [self addObject: eachObject];
 va_end(argumentList);
 }
 }
 */




#pragma mark - 测试部分

- (void)decimalHander1 {
    
//    NSRoundPlain,   取整
//    NSRoundDown,    只舍不入
//    NSRoundUp,      只入不舍
//    NSRoundBankers  四舍五入
    NSDecimalNumberHandler  *roundUp = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundBankers
                                                                                              scale:2
                                                                                   raiseOnExactness:NO
                                                                                    raiseOnOverflow:NO
                                                                                   raiseOnUnderflow:NO
                                                                                raiseOnDivideByZero:YES];
    
    NSDecimalNumber *subTotal = [NSDecimalNumber decimalNumberWithString:@"87.2369"];
    NSDecimalNumber *discount = [NSDecimalNumber decimalNumberWithString:@"0.22"];
    
    NSDecimalNumber *total = [subTotal decimalNumberByAdding:discount withBehavior:roundUp];
    
    NSLog(@"rounded total : %@",total);
}


- (void)compareDecimalNumber {
    NSDecimalNumber *discount1 = [NSDecimalNumber decimalNumberWithString:@".90"];
    NSDecimalNumber *discount2 = [NSDecimalNumber decimalNumberWithString:@".9"];
    NSComparisonResult result = [discount1 compare:discount2];
    
    if (result ==NSOrderedAscending) {
        NSLog(@"85%% < 90%%小于");
    }
    else if (result == NSOrderedSame) {
        NSLog(@"85%% == 90%%等于");
    }
    else if (result ==NSOrderedDescending) {
        NSLog(@"85%% > 90%%大于");
    }
}


- (void)multiplying {
    NSDecimalNumber*subtotal = [NSDecimalNumber decimalNumberWithString:@"40.98"];
    NSDecimalNumber*discount = [NSDecimalNumber decimalNumberWithString:@".90"];
    
//    NSDecimalNumber*total = [subtotal decimalNumberByMultiplyingBy:discount
//                                                      withBehavior:roundUp];
//    NSLog(@"Rounded total: %@", total);
}


@end
