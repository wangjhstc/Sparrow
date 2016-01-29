//
//  BezierPathVC.m
//  sparrow
//
//  Created by microsparrow on 16/1/27.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "BezierPathVC.h"

@interface BezierPathVC ()

@end

@implementation BezierPathVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self drawARC1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawARC {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = (CGRect){0,0,600,500};
    
    [self.view addSubview:view];
    
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100 / 2.f, 100 / 2.f)
//                                                        radius:100 / 2.f
//                                                    startAngle:0
//                                                      endAngle:M_PI * 2
//                                                     clockwise:YES];

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 200)];
//    [path addLineToPoint:CGPointMake(150, 180)];
//    [path addLineToPoint:CGPointMake(200, 190)];
//    [path addLineToPoint:CGPointMake(250, 180)];
//    [path addLineToPoint:CGPointMake(300, 220)];
    
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame         = view.bounds;                // 与showView的frame一致
    layer.strokeColor   = [UIColor greenColor].CGColor;   // 边缘线的颜色
    layer.fillColor     = [UIColor clearColor].CGColor;   // 闭环填充的颜色
    layer.lineCap       = kCALineCapSquare;               // 边缘线的类型
    layer.path          = path.CGPath;                    // 从贝塞尔曲线获取到形状
    layer.lineWidth     = 4.0f;                           // 线条宽度
    layer.strokeStart   = 0.0f;
    layer.strokeEnd     = 1.0f;
    layer.speed         = 0.1f;
//    layer.lineDashPhase = 0.3f;
    
    [view.layer addSublayer:layer];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        layer.strokeEnd     = 0.0f;
        
        [path addLineToPoint:CGPointMake(150, 180)];
        layer.path = path.CGPath;
        
        layer.speed = 0.1;
        layer.strokeStart = 0.0f;
        layer.strokeEnd = 1.0f;
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        layer.strokeEnd     = 0.0f;
        
        [path addLineToPoint:CGPointMake(200, 190)];
        layer.path = path.CGPath;
        
        
        
        
        layer.speed = 0.1;
        layer.strokeStart = 0.0;
        layer.strokeEnd = 1.0f;
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        layer.strokeEnd     = 0.0f;
        
        [path addLineToPoint:CGPointMake(250, 180)];
        layer.path = path.CGPath;
        
        layer.speed = 0.1;
        layer.strokeStart = 0.0;
        layer.strokeEnd = 1.0f;
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        layer.strokeEnd     = 0.0f;
        
        [path addLineToPoint:CGPointMake(300, 220)];
        layer.path = path.CGPath;
        
        layer.speed = 0.1;
        layer.strokeStart = 0.0;
        layer.strokeEnd = 1.0f;
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        layer.strokeEnd     = 0.0f;
        
        [path addLineToPoint:CGPointMake(350, 180)];
        layer.path = path.CGPath;
        
        layer.speed = 0.1;
        layer.strokeStart = 0.0;
        layer.strokeEnd = 1.0f;
    });
    
}

- (void)drawARC1 {

    // 创建layer并设置属性
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth =  2.0f;
    layer.lineCap = kCALineCapRound;
    layer.lineJoin = kCALineJoinRound;
    layer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    // 创建贝塞尔路径~
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(150, 200)];
    [path addLineToPoint:CGPointMake(200, 50)];
    [path addLineToPoint:CGPointMake(250, 150)];
    [path addLineToPoint:CGPointMake(300, 120)];
    
    // 关联layer和贝塞尔路径~
    layer.path = path.CGPath;
    
    // 创建Animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    layer.autoreverses = NO;
    animation.duration = 2.0;
    
    // 设置layer的animation
    [layer addAnimation:animation forKey:nil];
    
    // 第一种设置动画完成,不移除结果的方法
        animation.fillMode = kCAFillModeForwards;
        animation.removedOnCompletion = NO;
    
    // 第二种
//    layer.strokeEnd = 1;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [path addLineToPoint:CGPointMake(350, 160)];
        layer.path = path.CGPath;
        
        // 创建Animation
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.fromValue = @(0.0);
        animation.toValue = @(1.0);
        layer.autoreverses = NO;
        animation.duration = 2.0;
        
        // 设置layer的animation
        [layer addAnimation:animation forKey:nil];
    });
    
    
    
}

@end
