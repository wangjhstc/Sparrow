//
//  LineView.m
//  sparrow
//
//  Created by microsparrow on 16/1/26.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "LineView.h"

@interface LineView ()
{
    UIBezierPath    *bPath;
}

@end

@implementation LineView

- (id)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor grayColor];
        self.frame = [UIScreen mainScreen].bounds;//(CGRect){0,0,CGRectGetWidth([UIScreen mainScreen].bounds),320};
    }
    
    bPath = [UIBezierPath bezierPath];
    bPath.lineWidth = 10;
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    [[UIColor yellowColor] setStroke];
    
    [bPath strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
}
- (void)callMethod {
    CAShapeLayer *bezier = [[CAShapeLayer alloc] init];
    
    bezier.path          = bPath.CGPath;
    bezier.strokeColor   = [UIColor greenColor].CGColor;
    bezier.fillColor     = [UIColor clearColor].CGColor;
    bezier.lineWidth     = 11.0;
    bezier.strokeStart   = 0.0;
    bezier.strokeEnd     = 1.0;
    
    [self.layer addSublayer:bezier];
    
    [CATransaction begin]; {
        [CATransaction setCompletionBlock:^{
            
            
        }];
        CABasicAnimation *animateStrokeEnd = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animateStrokeEnd.duration  = 0.0;
        animateStrokeEnd.fromValue = [NSNumber numberWithFloat:0.0f];
        animateStrokeEnd.toValue   = [NSNumber numberWithFloat:1.0f];
        [bezier addAnimation:animateStrokeEnd forKey:@"strokeEndAnimation"];
    } [CATransaction commit];
    
    
    
    
    NSMutableArray *points = [NSMutableArray arrayWithObjects:
                              [NSValue valueWithCGPoint:CGPointMake(100, 400)],
                              [NSValue valueWithCGPoint:CGPointMake(150, 440)],
                              [NSValue valueWithCGPoint:CGPointMake(200, 420)],
                              [NSValue valueWithCGPoint:CGPointMake(250, 460)],
                              [NSValue valueWithCGPoint:CGPointMake(300, 450)],
                              [NSValue valueWithCGPoint:CGPointMake(350, 470)],
                              [NSValue valueWithCGPoint:CGPointMake(400, 410)],
                              [NSValue valueWithCGPoint:CGPointMake(450, 420)],
                              [NSValue valueWithCGPoint:CGPointMake(500, 460)],
                              [NSValue valueWithCGPoint:CGPointMake(550, 410)],
                              [NSValue valueWithCGPoint:CGPointMake(600, 425)],
                              [NSValue valueWithCGPoint:CGPointMake(650, 455)],
                              [NSValue valueWithCGPoint:CGPointMake(700, 435)],
                              [NSValue valueWithCGPoint:CGPointMake(750, 465)],
                              [NSValue valueWithCGPoint:CGPointMake(800, 475)],
                              [NSValue valueWithCGPoint:CGPointMake(850, 435)],
                              [NSValue valueWithCGPoint:CGPointMake(900, 465)],
                              [NSValue valueWithCGPoint:CGPointMake(950, 485)],
                              nil];
    
    for (NSValue *value in points) {
        sleep(1);
        [self refresh:value.CGPointValue];
    }

}

- (void)refresh:(CGPoint)point {
    
    [bPath addLineToPoint:point];
    
    [self setNeedsDisplay];
}








@end
