//
//  DynamicLayoutView.m
//  sparrow
//
//  Created by microsparrow on 16/3/21.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "DynamicLayoutView.h"
#import "Masonry.h"
@interface DynamicLayoutView ()

@property   (nonatomic,strong)  UILabel     *labName;

//@property   (nonatomic,strong)  UIImageView *imgBackground;

@end

@implementation DynamicLayoutView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    
    return self;
}

- (void)setupView {
    _labName = ({
        UILabel *labName = [[UILabel alloc] init];
        labName.font = [UIFont systemFontOfSize:14];
        labName.textColor = [UIColor redColor];
        labName.text = @"控件的名称";
        labName.textAlignment = NSTextAlignmentCenter;
        [self addSubview:labName];
        
        labName;
    });
    
    [self layoutView];
}

- (void)layoutIfNeeded {
    [self layoutView];
}

- (void)layoutView {
    __weak __typeof(self) weakself = self;
    
    [_labName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(weakself);
        make.size.mas_equalTo(weakself);
    }];
}

//prepareForInterfaceBuilder

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
}

#pragma mark - IBInspectable属性

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.masksToBounds = YES;
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius  = cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = borderWidth;
}


@end
