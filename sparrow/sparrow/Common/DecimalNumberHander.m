//
//  DecimalNumberHander.m
//  sparrow
//
//  Created by microsparrow on 16/2/15.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "DecimalNumberHander.h"

/**
 计算方式
 */
typedef enum : NSUInteger {
    CalculateOfAdd,/**< 加 */
    CalculateOfSubtract,/**< 减 */
    CalculateOfMultiply,/**< 乘 */
    CalculateOfDivide/**< 除 */
} CalculateType;

@interface DecimalNumberHander ()

/**
 *  @author wangjianghua, 16-02-17 09:02:55
 *
 *  @brief 取整
 */
@property (nonatomic,strong) NSDecimalNumberHandler  *roundPlainHander;

/**
 *  @author wangjianghua, 16-02-17 09:02:03
 *
 *  @brief 只舍不入
 */
@property (nonatomic,strong) NSDecimalNumberHandler  *roundDownHander;

/**
 *  @author wangjianghua, 16-02-17 09:02:24
 *
 *  @brief 只入不舍
 */
@property (nonatomic,strong) NSDecimalNumberHandler  *roundUpHander;

/**
 *  @author wangjianghua, 16-02-17 09:02:40
 *
 *  @brief 四舍五入
 */
@property (nonatomic,strong) NSDecimalNumberHandler  *roundBankersHander;

@end

/**
 *  @author wangjianghua, 16-02-17 09:02:31
 *
 *  @brief NSDecimalNumber 计算分类
 */
@implementation NSDecimalNumber (Calculate)

/**
 *  @author wangjianghua, 16-02-17 17:02:10
 *
 *  @brief 对NSDecimalNumber计算统一函数
 *
 *  @param decimalNumber NSDecimalNumber值
 *  @param calculateType 计算类型
 *  @param behavior      计算Hander
 *
 *  @return 返回计算结果
 */
- (NSDecimalNumber *)calculateDecimalNumber:(NSDecimalNumber *)decimalNumber
                              calculateType:(CalculateType)calculateType
                               withBehavior:(id <NSDecimalNumberBehaviors>)behavior {
    switch (calculateType) {
        case CalculateOfAdd:
            return [self decimalNumberByAdding:decimalNumber withBehavior:behavior];
            break;
        case CalculateOfSubtract:
            return [self decimalNumberBySubtracting:decimalNumber withBehavior:behavior];
            break;
        case CalculateOfMultiply:
            return [self decimalNumberByMultiplyingBy:decimalNumber withBehavior:behavior];
            break;
        case CalculateOfDivide:
            return [self decimalNumberByDividingBy:decimalNumber withBehavior:behavior];
            break;
        default:
            break;
    }
}

@end

@implementation DecimalNumberHander

#pragma mark - 类属性

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

#pragma mark - 基础单元

/**
 *  @author wangjianghua, 16-02-17 09:02:03
 *
 *  @brief 初始化NSDecimalNumberHandler
 *
 *  @param roundingMode 设置NSDecimalNumberHandler模式
 *
 *  @return NSDecimalNumberHandler实例
 */
- (NSDecimalNumberHandler *)allocHanderWithMode:(NSRoundingMode)roundingMode {
    NSDecimalNumberHandler *decimalHander   =   [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:roundingMode
                                                                                                       scale:2
                                                                                            raiseOnExactness:NO
                                                                                             raiseOnOverflow:NO
                                                                                            raiseOnUnderflow:NO
                                                                                         raiseOnDivideByZero:YES];
    return decimalHander;
}

/**
 *  @author wangjianghua, 16-02-17 16:02:58
 *
 *  @brief 多个参数公共计算
 *
 *  @param calculateType 计算类型
 *  @param param         计算的值
 *
 *  @return 返回计算值
 */
- (NSDecimalNumber *)calculateDecimalNumberWithMode:(CalculateType)calculateType param:(NSString *)param,... {
    NSDecimalNumber *decimalNumber = [NSDecimalNumber zero];
    
//    va_list arguments;
//    id eachObject;
//    
//    if (param) {
//        va_start(arguments, param);
//        while ((eachObject = va_arg(arguments, id))) {
//            NSDecimalNumber *eachObjectNumber = [NSDecimalNumber decimalNumberWithString:eachObject];
//            decimalNumber = [decimalNumber calculateDecimalNumber:eachObjectNumber calculateType:calculateType withBehavior:self.roundUpHander];
//        }
//        va_end(arguments);
//    }
    
    
    va_list arguments;
    
    if (param) {
        va_start(arguments,param);
        
        for (NSString *str = param; str != nil; str = va_arg(arguments,NSString*)) {
            NSDecimalNumber *eachObjectNumber = [NSDecimalNumber decimalNumberWithString:str];
            decimalNumber = [decimalNumber calculateDecimalNumber:eachObjectNumber calculateType:CalculateOfAdd withBehavior:self.roundUpHander];
        }
        
        va_end(arguments);
    }
    
    
    
    return decimalNumber;
}


#pragma mark - 函数重写

//- (NSString *)description
//{
//    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
//    NSString *price_description = [formatter stringFromNumber:self];
//    return price_description;
//}

- (NSString *)description {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
//    formatter setNumberStyle:NSNumberFormatterDecimalStyle
    
    
    return @"";
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
//    return [self calculateDecimalNumberWithMode:CalculateOfAdd param:value];

    
    NSDecimalNumber *decimalNumber = [NSDecimalNumber zero];
    
    va_list arguments;
    id eachObject;
    
    if (value) {
        va_start(arguments,value);
        decimalNumber = [NSDecimalNumber decimalNumberWithString:value];
        
        while ((eachObject = va_arg(arguments, NSString*))) {
            NSDecimalNumber *eachObjectNumber = [NSDecimalNumber decimalNumberWithString:eachObject];
            decimalNumber = [decimalNumber calculateDecimalNumber:eachObjectNumber calculateType:CalculateOfAdd withBehavior:self.roundUpHander];
        }

        //第二种
//        for (NSString *str = value; str != nil; str = va_arg(arguments,NSString*)) {
//            NSDecimalNumber *eachObjectNumber = [NSDecimalNumber decimalNumberWithString:str];
//            decimalNumber = [decimalNumber calculateDecimalNumber:eachObjectNumber calculateType:CalculateOfAdd withBehavior:self.roundUpHander];
//        }
        
        va_end(arguments);
    }
    
    return decimalNumber;
}

//- (void)transferList:(va_list)arguments {
//    for (NSString *str = value; str != nil; str = va_arg(arguments,NSString*)) {
//        NSDecimalNumber *eachObjectNumber = [NSDecimalNumber decimalNumberWithString:str];
//        decimalNumber = [decimalNumber calculateDecimalNumber:eachObjectNumber calculateType:CalculateOfAdd withBehavior:self.roundUpHander];
//    }
//}

/**
 *  @author wangjianghua, 16-02-17 17:02:53
 *
 *  @brief 相减
 *
 *  @param value value description
 *
 *  @return return value description
 */
- (NSDecimalNumber *)decimalNumberBySubtracting:(NSString *)value,... {
    return [self calculateDecimalNumberWithMode:CalculateOfSubtract param:value];
}

/**
 *  @author wangjianghua, 16-02-17 17:02:17
 *
 *  @brief 相乘
 *
 *  @param value value description
 *
 *  @return return value description
 */
- (NSDecimalNumber *)decimalNumberByMultiplying:(NSString *)value,... {
    return [self calculateDecimalNumberWithMode:CalculateOfMultiply param:value];
}



#pragma mark - 部分临时函数

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
