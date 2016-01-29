//
//  ViewController.m
//  sparrow
//
//  Created by microsparrow on 16/1/25.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "ViewController.h"
#import "inheritView.h"
#import "RectView.h"
#import "LineView.h"
#import "BezierPathVC.h"
#import "BezierPathView.h"
#import "myLineChat.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        [self presentViewController:loginVC animated:NO completion:nil];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%s",__FUNCTION__);
    
    
//    [self callBezierPath];
//    [self callView];
//    [self customButton];
//    [self createView];
    
//    [self bezierPathView];
//    [self bezierShape];
    
    
//    myLineChat *lineChat = [[myLineChat alloc] init];
//    lineChat.frame = (CGRect){100,100,500,500};
//    [lineChat initWithView];
//    [self.view addSubview:lineChat];
    
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        BezierPathVC *vc = [[BezierPathVC alloc] init];
//        vc.view.backgroundColor = [UIColor whiteColor];
//        [self presentViewController:vc animated:YES completion:nil];
//    });
    
    
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        LoginViewController *loginVC = [[LoginViewController alloc] init];
//        [self presentViewController:loginVC animated:YES completion:nil];
//    });
    
    
//    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor redColor];
//    view.frame = (CGRect){100,100,200,80};
//    [self.view addSubview:view];
    
//    6214 8357 1127 9461
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"wangjhstc" forState:UIControlStateNormal];
    [button setFrame:(CGRect){100,100,180,70}];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(touchChange:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self wiggleControl:view];
//    });

    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self wiggleControl:view];
        
        [self wiggleControl:button];
        [button setTitle:@"汪江华" forState:UIControlStateNormal];
    });
    
}

- (void)touchChange:(UIButton *)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)wiggleControl:(UIView *)view {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[@0,@4,@-4,@4,@-4,@4,@-4,@4,@0];
    animation.duration = 0.3;
    animation.additive = YES;
    [view.layer addAnimation:animation forKey:@"wiggle"];
}

#pragma mark - 视图调用

- (void)callView {
    
//    static CFTimeInterval const kDuration = 2.0;

    
    {
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
        
        RectView *rectView = [[RectView alloc] init];
        rectView.opaque = NO;
        rectView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:rectView];
        
        rectView.shapeLayer.fillColor = nil;
        rectView.shapeLayer.strokeColor = [UIColor redColor].CGColor;
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
        animation.fromValue = @0.0f;
        animation.toValue   = @0.1f;
        animation.delegate  = self;
        
        [rectView.shapeLayer addAnimation:animation forKey:NSStringFromSelector(@selector(strokeEnd))];
        
        [self moveNewPoint:points view:rectView];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            sleep(5);
            
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
            animation.fromValue = @0.0f;
            animation.toValue   = @1.5f;
            animation.delegate  = self;
            
            [rectView.shapeLayer addAnimation:animation forKey:NSStringFromSelector(@selector(strokeEnd))];
            
//            NSMutableArray *points1 = [[NSMutableArray alloc] init];
//            [points1 addObject:points.lastObject];
//            [points1 addObject:[NSValue valueWithCGPoint:CGPointMake(1000, 455)]];
            
            [points addObject:[NSValue valueWithCGPoint:CGPointMake(1000, 455)]];
            
            [self moveNewPoint:points view:rectView];
        });
        
        
    }
    
    {
//        //直接调用
//        awakeNibView *anibView = [[awakeNibView alloc] init];
//        anibView.backgroundColor = [UIColor yellowColor];
//        
//        [self.view addSubview:anibView];
    }
    
    {
//        //调用xib 加载awakeFromNib
//        awakeNibView *awakeNib = [[NSBundle mainBundle] loadNibNamed:@"awakeNibView" owner:nil options:nil].firstObject;
//        awakeNib.frame = (CGRect){0,0,520,100};
//        awakeNib.backgroundColor = [UIColor lightGrayColor];
//        [self.view addSubview:awakeNib];
    }
}

- (void)moveNewPoint:(NSArray *)points view:(RectView *)rectView {
    
    static CGFloat const kPointDiameter = 7.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:[[points firstObject] CGPointValue]];
    
    //设置路径的颜色和动画
    CGPoint point = [[points firstObject] CGPointValue];
    [path appendPath:[UIBezierPath bezierPathWithArcCenter:point radius:kPointDiameter / 2.0 startAngle:0.0 endAngle:2 * M_PI clockwise:YES]];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1, [points count] - 1)];
    [points enumerateObjectsAtIndexes:indexSet
                              options:0
                           usingBlock:^(NSValue *pointValue, NSUInteger idx, BOOL *stop) {
                               [path addLineToPoint:[pointValue CGPointValue]];
                               [path appendPath:[UIBezierPath bezierPathWithArcCenter:[pointValue CGPointValue] radius:kPointDiameter / 2.0 startAngle:0.0 endAngle:2 * M_PI clockwise:YES]];
                           }];
    path.usesEvenOddFillRule = YES;
    rectView.shapeLayer.path = path.CGPath;
}

//delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
}

#pragma mark - UIBezierPath Line

- (void)callBezierPath {
    LineView *lineView = [[LineView alloc] init];
    [self.view addSubview:lineView];
    
    [lineView callMethod];
}

- (void)callBezierPathView {
    
}

//- (void)bezierPathViewUpdate {
//    {
//        UIBezierPath *path = [[UIBezierPath alloc] init];
//        for (NSValue *pointValue in self.points) {
//            CGPoint point = [pointValue CGPointValue];
//            [path appendPath:[UIBezierPath bezierPathWithArcCenter:point radius:kPointDiameter / 2.0 startAngle:0.0 endAngle:2 * M_PI clockwise:YES]];
//        }
//        self.pointsShapeView.shapeLayer.path = path.CGPath;
//    }
//    
//    if ([self.points count] >= 2) {
//        UIBezierPath *path = [[UIBezierPath alloc] init];
//        [path moveToPoint:[[self.points firstObject] CGPointValue]];
//        
//        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1, [self.points count] - 1)];
//        [self.points enumerateObjectsAtIndexes:indexSet
//                                       options:0
//                                    usingBlock:^(NSValue *pointValue, NSUInteger idx, BOOL *stop) {
//                                        [path addLineToPoint:[pointValue CGPointValue]];
//                                    }];
//        
//        self.pathShapeView.shapeLayer.path = path.CGPath;
//    }
//    else {
//        self.pathShapeView.shapeLayer.path = nil;
//    }
//    
//    if ([self.points count] >= 1 && self.prospectivePointValue) {
//        UIBezierPath *path = [[UIBezierPath alloc] init];
//        [path moveToPoint:[[self.points lastObject] CGPointValue]];
//        [path addLineToPoint:[self.prospectivePointValue CGPointValue]];
//        
//        self.prospectivePathShapeView.shapeLayer.path = path.CGPath;
//    }
//    else {
//        self.prospectivePathShapeView.shapeLayer.path = nil;
//    }
//}

#pragma mark - customButton
/**
 *  @author wangjianghua, 16-01-26 17:01:04
 *
 *  @brief 传参过程中的优化
 */
- (void)customButton {
    
    /**原有写法 start*/
    UIButton *buton = [UIButton buttonWithType:UIButtonTypeCustom];
    buton.backgroundColor = [UIColor yellowColor];
    buton.frame = (CGRect){0,0,200,80};
    buton.tag   = 200;
    
    [self buttonTarget:buton];
    /**原有写法 end*/
  
    /**现有的新方式 start*/
    [self buttonTarget:({
        UIButton *buton = [UIButton buttonWithType:UIButtonTypeCustom];
        buton.backgroundColor = [UIColor yellowColor];
        buton.frame = (CGRect){0,0,200,80};
        buton.tag   = 200;
        
        buton;
    })];
    /**现有的新方式 end*/
}

- (void)buttonTarget:(UIButton *)sender {
    
    NSLog(@"%zi",sender.tag);
    
}

#pragma mark - line

- (void)createView {
    CAShapeLayer *chartLine = [CAShapeLayer layer];
    chartLine.lineCap = kCALineCapSquare;
    chartLine.lineWidth = 1;
    
    [self.view.layer addSublayer:chartLine];
    
    
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
    
//    for (NSValue *value in points) {
//        sleep(1);
//
//    }
    
    
    UIBezierPath *progressLine = [UIBezierPath bezierPath];
    
//    for (NSValue *value in points) {
//        [progressLine addLineToPoint:value.CGPointValue];
//        [progressLine moveToPoint:value.CGPointValue];
//    }
    
    static CGFloat const kPointDiameter = 7.0;
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1, [points count] - 1)];
    [points enumerateObjectsAtIndexes:indexSet
                              options:0
                           usingBlock:^(NSValue *pointValue, NSUInteger idx, BOOL *stop) {
//                               [progressLine addLineToPoint:[pointValue CGPointValue]];
                               [progressLine appendPath:[UIBezierPath bezierPathWithArcCenter:[pointValue CGPointValue] radius:kPointDiameter / 2.0 startAngle:0.0 endAngle:2 * M_PI clockwise:YES]];
                           }];
    
    
    
    chartLine.path = progressLine.CGPath;
    chartLine.strokeColor = [UIColor redColor].CGColor;
    

    
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 3.0;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses = NO;
    pathAnimation.fillMode = kCAFillModeRemoved;
    pathAnimation.repeatCount = 1;
    
    [chartLine addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
}

#pragma mark - BezierPathView

- (void)bezierPathView {
    BezierPathView *pathView = [[BezierPathView alloc] init];
    [self.view addSubview:pathView];
}

- (void)bezierShape {
    /*绘图绘图，从起点到终点 一直绘下去，不要乱了顺序*/
    //create path
    UIBezierPath *path = [[UIBezierPath alloc] init];
    //（1）首先设置一个起点
    [path moveToPoint:CGPointMake(150, 75)];
    //（2）跟着我画一个弧线 CGPointMake(150, 125) 是终点， CGPointMake(120, 100) 是控制弧度
    [path addQuadCurveToPoint:CGPointMake(150, 125) controlPoint:CGPointMake(120, 100)];
    //（3）跟着我再跟着顺序 画一条直线条 （2）
    [path addLineToPoint:CGPointMake(250, 125)];
    //（4）同上，也是一个弧线
    [path addQuadCurveToPoint:CGPointMake(250, 75) controlPoint:CGPointMake(230, 100)];
    //（5）再从弧线到 起点 也就是终点
    [path addLineToPoint:CGPointMake(150, 75)];
    
    //1-5 这样就构成一个图形，是按顺序来
    
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineCapRound; //终点处理
    
    //    create shape layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    shapeLayer.lineWidth = 1;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    //add it to our view
    [self.view.layer addSublayer:shapeLayer];
}

@end
