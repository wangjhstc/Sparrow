//
//  RectView.m
//  sparrow
//
//  Created by microsparrow on 16/1/26.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "RectView.h"

@implementation RectView

+ (Class)layerClass {
    return [CAShapeLayer class];
}

- (CAShapeLayer *)shapeLayer {
    return (CAShapeLayer *)self.layer;
}


//- (id)initWithFrame:(CGRect)frame {
//    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor lightGrayColor];
//        self.frame = (CGRect){0,0,CGRectGetWidth([UIScreen mainScreen].bounds),120};
//    }
//    
//    return self;
//}


//- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(context, 1.0f);
//    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
//    CGContextStrokeRect(context, CGRectMake(110.0, 15.0, 100, 100));
//    CGContextStrokePath(context);
//}

@end
