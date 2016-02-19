//
//  NSDictionary+Unicode.m
//  sparrow
//
//  Created by microsparrow on 16/2/18.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "NSDictionary+Unicode.h"
#import <objc/runtime.h>


//IMP orginIMP;

@implementation NSDictionary (Unicode)

- (NSString *)getDescription {
    NSString *description = [self description];
    return [NSString stringWithCString:[description cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
}

NSString* getDescription() {
    
    return @"wangjhstc";
}


- (void)replaceMethod {
    Class string = [NSString class];
    SEL origeString = @selector(description);
//    IMP orginIMP = [NSString instanceMethodForSelector:origeString];
    
    class_replaceMethod(string, origeString,(IMP)getDescription , NULL);
}

@end
