//
//  myLineChat.h
//  view
//
//  Created by ren on 14-7-30.
//  Copyright (c) 2014年 ren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myLineChat : UIView <UIScrollViewDelegate>
{
    UIScrollView *scrollView;
}

@property (nonatomic,retain) CAShapeLayer *lineChart;
@property (nonatomic,retain) UIColor *lineChartBgColor;

@property (nonatomic,retain) NSMutableArray *valueArray;
@property (nonatomic,retain) NSMutableArray *titleArray;

@property (nonatomic) float lineWidth,lineTitleWidth,lineBetweenWidth,lineHeight;
@property (nonatomic,retain) UIColor *lineColor;

-(void)initWithView;

@end
