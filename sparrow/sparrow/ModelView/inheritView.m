//
//  inheritView.m
//  sparrow
//
//  Created by microsparrow on 16/1/26.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "inheritView.h"

@implementation inheritView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSLog(@"inheritView:%s",__FUNCTION__);
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

    }
    
    NSLog(@"inheritView:%s",__FUNCTION__);
    
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
