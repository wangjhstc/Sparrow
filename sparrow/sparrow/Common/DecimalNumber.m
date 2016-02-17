//
//  DecimalNumber.m
//  sparrow
//
//  Created by microsparrow on 16/2/15.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "DecimalNumber.h"

@implementation DecimalNumber

- (NSDecimalNumber *)mantissa {
    NSDecimalNumber *number = [NSDecimalNumber decimalNumberWithMantissa:12345
                                                                exponent:2  //往右补零还是往左(求方)
                                                              isNegative:NO //值是否为负值
                               ];
    
    return number;
}

- (NSDecimalNumber *)add {
    NSDecimalNumber *number = [NSDecimalNumber zero];
    
    double value = 9.909 * 9999;
    
    NSDecimalNumber *number1 = [[NSDecimalNumber alloc]  initWithDouble:value];
    
    
    return [number decimalNumberByAdding:number1];
}

- (NSString *)multiplyingWithValue:(NSString *)value value2:(NSString *)value2 {
    return decimalNumberMutiplyWithString(value, value2);
}

NSString *decimalNumberMutiplyWithString(NSString *multiplierValue,NSString *multiplicandValue)
{
    NSDecimalNumber *multiplierNumber   = [NSDecimalNumber decimalNumberWithString:multiplierValue];
    NSDecimalNumber *multiplicandNumber = [NSDecimalNumber decimalNumberWithString:multiplicandValue];
    NSDecimalNumber *product = [multiplicandNumber decimalNumberByMultiplyingBy:multiplierNumber];
    return [product stringValue];
}




@end
