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
        
        CGRect rect = [UIScreen mainScreen].bounds;
        
        self.frame = (CGRect){0,0,CGRectGetWidth(rect),120};
    }

    NSLog(@"%s",__FUNCTION__);
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor redColor];
    
    NSLog(@"%s",__FUNCTION__);
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor grayColor];
    }
    
    NSLog(@"%s",__FUNCTION__);
    
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
