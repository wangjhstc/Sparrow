//
//  DecimalNumberHander.h
//  sparrow
//
//  Created by microsparrow on 16/2/15.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DecimalNumberHander : NSObject

- (void)decimalHander1;

- (void)compareDecimalNumber;


#pragma mark - 元素函数

/**
 *  @author wangjianghua, 16-02-19 14:02:19
 *
 *  @brief 多个数据相加
 *
 *  @param value value description
 *
 *  @return return value description
 */
- (NSDecimalNumber *)decimalNumberByAdding:(NSString *)value, ... NS_REQUIRES_NIL_TERMINATION;//NS_REQUIRES_NIL_TERMINATION;

@end
