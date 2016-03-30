//
//  awakeNibView.m
//  sparrow
//
//  Created by microsparrow on 16/1/26.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "awakeNibView.h"

@implementation awakeNibView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor yellowColor];
        
        CGRect rect = [UIScreen mainScreen].bounds;
        self.frame = (CGRect){0,0,CGRectGetWidth(rect),120};
    }

    NSLog(@"%s",__FUNCTION__);
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSLog(@"%s",__FUNCTION__);
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    
    NSLog(@"%s",__FUNCTION__);
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 200);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextStrokeRect(context, CGRectMake(110.0, 110.0, 100, 100));
    CGContextStrokePath(context);
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
}

- (void)drawRect:(CGRect)rect forViewPrintFormatter:(UIViewPrintFormatter *)formatter {
    
}

- (void)layout {
    
}

@end
