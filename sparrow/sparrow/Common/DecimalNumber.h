//
//  DecimalNumber.h
//  sparrow
//
//  Created by microsparrow on 16/2/15.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DecimalNumber : NSObject

- (NSDecimalNumber *)mantissa;

- (NSDecimalNumber *)add;

- (NSString *)multiplyingWithValue:(NSString *)value value2:(NSString *)value2;

@end
