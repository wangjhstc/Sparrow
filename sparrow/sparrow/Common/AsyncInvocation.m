//
//  AsyncInvocation.m
//  sparrow
//
//  Created by microsparrow on 16/2/3.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "AsyncInvocation.h"

@implementation AsyncInvocation

- (void)createDispatchGroup {
    dispatch_queue_t queue = dispatch_queue_create([@"com.sparrowkit.group" UTF8String], DISPATCH_QUEUE_SERIAL);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        
    });
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    dispatch_group_notify(group, queue, ^{
        
    });
}

@end
