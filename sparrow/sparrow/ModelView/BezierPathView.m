//
//  BezierPathView.m
//  sparrow
//
//  Created by microsparrow on 16/1/27.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "BezierPathView.h"

//http://www.jianshu.com/p/bbb2cc485a45

@implementation BezierPathView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.frame = (CGRect){0,0,CGRectGetWidth([UIScreen mainScreen].bounds),300};
        
        self.backgroundColor = [UIColor yellowColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    
//    [self drawArc];
//    [self drawLine];
    
//    [self drawBezier1];
    
//    [self drawBezierArc];
//    [self drawLine1];
    
}


#pragma mark - UIBezierPath

- (void)drawARC {
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 添加圆到path
    [path addArcWithCenter:self.center radius:100.0 startAngle:0.0 endAngle:M_PI*2 clockwise:YES];
    // 设置描边宽度（为了让描边看上去更清楚）
    [path setLineWidth:5.0];
    //设置颜色（颜色设置也可以放在最上面，只要在绘制前都可以）
    [[UIColor blueColor] setStroke];
    [[UIColor redColor] setFill];
    // 描边和填充
    [path stroke];
    [path fill];
}

- (void)drawArc {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:self.center radius:100.0 startAngle:0.0 endAngle:180.0 clockwise:YES];
    [path stroke];
}

- (void)drawArc1 {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:self.center radius:100.0 startAngle:0.0 endAngle:180.0 clockwise:YES];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGPathRef   pathR = path.CGPath;
    CGContextSetShouldAntialias(context, NO);
    CGContextAddPath(context, pathR);
    CGContextStrokePath(context);
}

- (void)drawLine {
    // 创建path
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 添加路径[1条点(100,100)到点(200,100)的线段]到path
    [path moveToPoint:CGPointMake(100 , 100)];
    [path addLineToPoint:CGPointMake(200, 100)];
    // 将path绘制出来
    [path stroke];
}

- (void)drawLine1 {
    UIColor *color = [UIColor redColor];
    [color set];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 2.0f;
    bezierPath.lineCapStyle  = kCGLineCapSquare;
    bezierPath.lineJoinStyle = kCGLineCapRound;
    
    [bezierPath moveToPoint:CGPointMake(100, 100)];//设置起始点
    [bezierPath addLineToPoint:CGPointMake(150, 120)];
    [bezierPath addLineToPoint:CGPointMake(200, 130)];
    [bezierPath addLineToPoint:CGPointMake(250, 110)];
    [bezierPath addLineToPoint:CGPointMake(300, 140)];
    [bezierPath addLineToPoint:CGPointMake(350, 130)];
    [bezierPath addLineToPoint:CGPointMake(400, 120)];
    
    [bezierPath closePath];//将点闭合起来
    
    [bezierPath fill];//填充闭合后的颜色
    
    [bezierPath stroke];
    
}

- (void)drawBezier {
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [aPath moveToPoint:CGPointMake(20, 100)];
    
    [aPath addQuadCurveToPoint:CGPointMake(120, 100) controlPoint:CGPointMake(70, 0)];
    
    [aPath stroke];
}

- (void)drawBezier1 {
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [aPath moveToPoint:CGPointMake(5, 80)];
    
    [aPath addCurveToPoint:CGPointMake(155, 80) controlPoint1:CGPointMake(80, 0) controlPoint2:CGPointMake(110, 100)];
    
    [aPath stroke];
}

- (void)drawBezierArc {
    
#define pi 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((pi * degrees)/ 180)
    
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(80, 80)
                                                         radius:75
                                                     startAngle:0
                                                       endAngle:DEGREES_TO_RADIANS(135)
                                                      clockwise:YES];
    
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [aPath stroke];
}


#pragma mark - CAS

- (void)drawSL {
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100 / 2.f, 100 / 2.f)
                                                        radius:100 / 2.f
                                                    startAngle:0
                                                      endAngle:M_PI * 2
                                                     clockwise:YES];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame         = self.bounds;                // 与showView的frame一致
    layer.strokeColor   = [UIColor greenColor].CGColor;   // 边缘线的颜色
    layer.fillColor     = [UIColor clearColor].CGColor;   // 闭环填充的颜色
    layer.lineCap       = kCALineCapSquare;               // 边缘线的类型
    layer.path          = path.CGPath;                    // 从贝塞尔曲线获取到形状
    layer.lineWidth     = 4.0f;                           // 线条宽度
    layer.strokeStart   = 0.0f;
    layer.strokeEnd     = 0.1f;
    
    
    [self.layer addSublayer:layer];
}





@end
