//
//  DynamicLayoutView.h
//  sparrow
//
//  Created by microsparrow on 16/3/21.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface DynamicLayoutView : UIView

@property   (nonatomic,assign)      IBInspectable       CGFloat borderWidth;
@property   (nonatomic,strong)      IBInspectable       UIColor *borderColor;

@property   (nonatomic,assign)      IBInspectable       CGFloat cornerRadius;

@property   (nonatomic,assign)      IBInspectable       CGRect  frameRect;


@end
