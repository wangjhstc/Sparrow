//
//  LoadDataHelper.h
//  sparrow
//
//  Created by microsparrow on 16/2/18.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoadDataModel.h"

@interface LoadDataHelper : NSObject

@property   (nonatomic,strong)  NSArray *dataArray;

+ (instancetype)shareInstance;

- (void)setValueWithKey:(NSArray *)array;

- (void)setValueWithForIN:(NSArray *)array;

- (void)setValueWithGCD:(NSArray *)array;

@end
