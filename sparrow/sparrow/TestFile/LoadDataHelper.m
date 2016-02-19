//
//  LoadDataHelper.m
//  sparrow
//
//  Created by microsparrow on 16/2/18.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "LoadDataHelper.h"

@implementation LoadDataHelper

+ (instancetype)shareInstance {
    static LoadDataHelper   *loadDataHelper;
    static dispatch_once_t  oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        loadDataHelper = [[self alloc] init];
    });
    
    return loadDataHelper;
}


- (NSArray *)dataArray {
    if (_dataArray == nil || _dataArray.count <= 0) {
        _dataArray = [self loadData];
    }
    
    return _dataArray;
}


- (NSArray *)loadData {
    
    NSUInteger  capacity = 100;

    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:capacity];
    
    for (NSInteger index = 0; index < capacity; index++) {
        
        @autoreleasepool {
            
            LoadDataModel *model = [[LoadDataModel alloc] init];
            model.name  = [[NSString alloc] initWithFormat:@"name : %zi",index];
            model.name1 = [[NSString alloc] initWithFormat:@"name1 : %zi",index];
            model.name2 = [[NSString alloc] initWithFormat:@"name2 : %zi",index];
            model.name3 = [[NSString alloc] initWithFormat:@"name3 : %zi",index];
            model.name4 = [[NSString alloc] initWithFormat:@"name4 : %zi",index];
            model.name5 = [[NSString alloc] initWithFormat:@"name5 : %zi",index];
            model.name6 = [[NSString alloc] initWithFormat:@"name6 : %zi",index];
            model.name7 = [[NSString alloc] initWithFormat:@"name7 : %zi",index];
            model.name8 = [[NSString alloc] initWithFormat:@"name8 : %zi",index];
            model.name9 = [[NSString alloc] initWithFormat:@"name9 : %zi",index];
            model.name10 = [[NSString alloc] initWithFormat:@"name10 : %zi",index];
            model.name11 = [[NSString alloc] initWithFormat:@"name11 : %zi",index];
            model.name12 = [[NSString alloc] initWithFormat:@"name12 : %zi",index];
            model.name13 = [[NSString alloc] initWithFormat:@"name13 : %zi",index];
            model.name14 = [[NSString alloc] initWithFormat:@"name14 : %zi",index];
            
            [array addObject:model];
        }
    }
    
    return array;
}

- (void)setValueWithKey:(NSArray *)array {
    [array setValuesForKeysWithDictionary:@{@"isChange":@YES}];
    NSLog(@"ForKey : compted");
}

- (void)setValueWithForIN:(NSArray *)array {
    for (LoadDataModel *model in array) {
        model.isChange = YES;
    }
    
    NSLog(@"ForIN : compted");
}

- (void)setvalueWithDispatch:(NSArray *)array {
//    __weak typeof(self) weakself = self;
    
    dispatch_barrier_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    });
    
    dispatch_barrier_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    });
    
    dispatch_barrier_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    });
    
}

- (void)setValueWithGCD:(NSArray *)array {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("com.sparrowkit.wangjhstc", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_async(group, queue, ^{
        for (NSInteger index = 0; index < array.count; index++) {
            LoadDataModel *model = array[index];
            model.isChange = YES;
        }
    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"group : compted");
    });

    
    
    
//    dispatch_group_async(group, queue, ^{
//        for (NSInteger index = 0; index < 200000; index++) {
//            LoadDataModel *model = array[index];
//            model.isChange = YES;
//        }
//    });
//    
//    dispatch_group_async(group, queue, ^{
//        for (NSInteger index = 200000; index < 400000; index++) {
//            LoadDataModel *model = array[index];
//            model.isChange = YES;
//        }
//    });
//    
//    dispatch_group_async(group, queue, ^{
//        for (NSInteger index = 400000; index < 600000; index++) {
//            LoadDataModel *model = array[index];
//            model.isChange = YES;
//        }
//    });
//    
//    dispatch_group_async(group, queue, ^{
//        for (NSInteger index = 600000; index < 800000; index++) {
//            LoadDataModel *model = array[index];
//            model.isChange = YES;
//        }
//    });
//    
//    dispatch_group_async(group, queue, ^{
//        for (NSInteger index = 800000; index < 1000000; index++) {
//            LoadDataModel *model = array[index];
//            model.isChange = YES;
//        }
//    });
//    
//    dispatch_group_notify(group, queue, ^{
//        NSLog(@"group : compted");
//    });
}


@end
