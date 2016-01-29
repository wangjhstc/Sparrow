//
//  myLineChat.m
//  view
//
//  Created by ren on 14-7-30.
//  Copyright (c) 2014年 ren. All rights reserved.
//

#import "myLineChat.h"

@implementation myLineChat

@synthesize lineChart;
@synthesize lineChartBgColor;

@synthesize valueArray;
@synthesize titleArray;

@synthesize lineWidth,lineTitleWidth,lineBetweenWidth,lineHeight;
@synthesize lineColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        titleArray=[[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8", nil];
        valueArray=[[NSMutableArray alloc] initWithObjects:@"12",@"52",@"45",@"92",@"65",@"15",@"37",@"51", nil];
        lineChartBgColor=[UIColor whiteColor];
        
        lineWidth=2;
        lineTitleWidth=30;
        lineBetweenWidth=20;
        lineHeight=200;
        
        lineColor=[UIColor purpleColor];

        lineChart=[[CAShapeLayer alloc] init];
        lineChart.lineCap=kCALineCapRound;
        lineChart.fillColor=nil;
        lineChart.lineWidth=lineWidth;
        
//        //***************用法*************
//        NSMutableArray *dataTitleArray=[[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
//        NSMutableArray *dataArray=[[NSMutableArray alloc] initWithObjects:@"86",@"2",@"45",@"92",@"65",@"15",@"37",@"51",@"94",nil];
//        
//        myLineChat *mylinechart=[[myLineChat alloc] initWithFrame:CGRectMake(10,150, 300, 300)];
//        mylinechart.backgroundColor=[UIColor clearColor];
//        mylinechart.titleArray=dataTitleArray;
//        mylinechart.valueArray=dataArray;
//        mylinechart.lineChartBgColor=[UIColor whiteColor];
//        mylinechart.lineTitleWidth=30;
//        mylinechart.lineBetweenWidth=30;
//        mylinechart.lineWidth=2;
//        mylinechart.lineHeight=150;
//        mylinechart.lineColor=[UIColor purpleColor];
//        [mylinechart initWithView];
//        [self.view addSubview:mylinechart];
        
    }
    return self;
}

-(void)initWithView
{
    float scrollViewWidth=[valueArray count]*lineTitleWidth+([valueArray count]+1)*lineBetweenWidth;
    scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    scrollView.directionalLockEnabled=YES;
    scrollView.pagingEnabled=NO;
    scrollView.backgroundColor=lineChartBgColor;
    scrollView.showsHorizontalScrollIndicator=YES;
    scrollView.indicatorStyle=UIScrollViewIndicatorStyleWhite;
    scrollView.showsVerticalScrollIndicator=NO;
    scrollView.delegate=self;
    scrollView.bounces=YES;
    scrollView.contentSize=CGSizeMake(scrollViewWidth, self.frame.size.height);
    scrollView.contentOffset=CGPointMake(0, 0);
    [self addSubview:scrollView];
    
    UIBezierPath *progressline=[UIBezierPath bezierPath];
    [progressline setLineWidth:lineWidth];
    [progressline setLineCapStyle:kCGLineCapRound];
    lineChart.strokeColor=[lineColor CGColor];
    [scrollView.layer addSublayer:lineChart];
    
    for(int i=0;i<[valueArray count];i++)
    {
        
        UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(lineBetweenWidth+i*(lineTitleWidth+lineBetweenWidth), 0, lineTitleWidth, lineTitleWidth)];
        title.text=[titleArray objectAtIndex:i];
        title.textColor=[UIColor blackColor];
        title.alpha=1;
        title.textAlignment=NSTextAlignmentCenter;
        [scrollView addSubview:title];
        
        UIView *point=[[UIView alloc] initWithFrame:CGRectMake(lineBetweenWidth+i*(lineTitleWidth+lineBetweenWidth)+(lineTitleWidth-8)/2, lineHeight/100.0*[[valueArray objectAtIndex:i] floatValue]+lineTitleWidth, 8,8)];
        point.backgroundColor=lineColor;
        point.alpha=0;
        point.layer.masksToBounds=YES;
        point.layer.cornerRadius=4;
        point.layer.borderWidth=1;
        point.layer.borderColor=[UIColor whiteColor].CGColor;
        [scrollView addSubview:point];
        
        if(i==0)
        {
            [progressline moveToPoint:CGPointMake(lineBetweenWidth+i*(lineTitleWidth+lineBetweenWidth)+lineTitleWidth/2,  lineHeight/100.0*[[valueArray objectAtIndex:i] floatValue]+lineTitleWidth+4)];
        }
        else
        {
            [progressline addLineToPoint:CGPointMake(lineBetweenWidth+i*(lineTitleWidth+lineBetweenWidth)+lineTitleWidth/2,  lineHeight/100.0*[[valueArray objectAtIndex:i] floatValue]+lineTitleWidth+4)];
        }
        lineChart.path=progressline.CGPath;
        
        UILabel *word=[[UILabel alloc] initWithFrame:CGRectMake(lineBetweenWidth+i*(lineTitleWidth+lineBetweenWidth), lineHeight/100.0*[[valueArray objectAtIndex:i] floatValue],lineTitleWidth,lineTitleWidth)];
        if(lineHeight/100.0*[[valueArray objectAtIndex:i] floatValue]<lineTitleWidth)
        {
            word.frame=CGRectMake(lineBetweenWidth+i*(lineTitleWidth+lineBetweenWidth), lineHeight/100.0*[[valueArray objectAtIndex:i] floatValue]+lineTitleWidth,lineTitleWidth,lineTitleWidth);
        }
        word.text=[valueArray objectAtIndex:i];
        word.textColor=lineColor;
        word.alpha=0;
        word.textAlignment=NSTextAlignmentCenter;
        [scrollView addSubview:word];
        
        [UIView beginAnimations:nil context:nil]; //标记动画的开始
        //持续时间
        [UIView setAnimationDuration:2.0f];  //动画的持续时间
        
        point.alpha=0.7;
        word.alpha=1;
        
        [UIView commitAnimations];//标记动画的结束
        
    }
    
    UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0, lineTitleWidth, scrollViewWidth, 0.5)];
    line.backgroundColor=lineColor;
    [scrollView addSubview:line];
    
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 2.0;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses = NO;
    [lineChart addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    lineChart.strokeEnd = 1.0;
    
    [UIView beginAnimations:nil context:nil]; //标记动画的开始
    //持续时间
    [UIView setAnimationDuration:2.0f];  //动画的持续时间
    
    scrollView.contentOffset=CGPointMake(scrollViewWidth-scrollView.frame.size.width, 0);
    
    [UIView commitAnimations];//标记动画的结束
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
