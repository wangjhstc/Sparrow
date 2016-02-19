//
//  LoginViewController.m
//  sparrow
//
//  Created by microsparrow on 16/1/27.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "LoginViewController.h"
#import "LoadDataHelper.h"


@interface LoginModel : NSObject

@property   (nonatomic,strong)  NSString    *name;

@property   (nonatomic,strong)  NSString    *password;

@end

@implementation LoginModel


@end


@interface LoginViewController () <UIGestureRecognizerDelegate> {
    UITapGestureRecognizer  *tapPress;
}

@property   (nonatomic,strong)  UIImageView     *userIco;

@property   (nonatomic,strong)  UITextField     *txtUserName;

@property   (nonatomic,strong)  UIButton        *btnLogin;

@property   (nonatomic,strong)  UILabel         *labUserName;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    [self visualUserIco];
    [self visualUserName];
    [self visualLoginField];
    
    [self addObserver];
}

- (void)dealloc {
    [self removeObserver];
}

- (void)addObserver {
//    [_txtUserName addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)removeObserver {
//    [_txtUserName removeObserver:self forKeyPath:@"text" context:nil];
}

- (void)visualUserIco {
    _userIco = [[UIImageView alloc] initWithFrame:(CGRect){150,180,100,100}];
    _userIco.image = [UIImage imageNamed:@"userIco"];
//    _userIco.image = [UIImage imageWithContentsOfFile:@"userIco.png"];
    _userIco.userInteractionEnabled = YES;
    _userIco.layer.masksToBounds= YES;
    _userIco.layer.cornerRadius = 6.0f;
    _userIco.layer.borderColor  = [UIColor yellowColor].CGColor;
    _userIco.layer.borderWidth  = 3.0f;
    
    tapPress = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchUserIco:)];
    tapPress.numberOfTapsRequired = 1;
    tapPress.numberOfTouchesRequired = 1;
    tapPress.delegate = self;
    
    [_userIco removeGestureRecognizer:tapPress];
    [_userIco addGestureRecognizer:tapPress];
    
    [self.view addSubview:_userIco];
}

- (void)visualUserName {
    
}

- (void)visualLoginField {
    //监听文本改变的三种方式
    {
//        1、KVO方式
//        [textField addObserver:self forKeyPath:@"text" options:0 context:nil];
//        2、直接添加监视
//        [textField addTarget:self  action:@selector(valueChanged:)  forControlEvents:UIControlEventAllEditingEvents];
//        3、注册消息通知
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChanged:) name:UITextFieldTextDidChangeNotification object:textField];
    }
    
    _txtUserName = [[UITextField alloc] initWithFrame:(CGRect){80,320,240,45}];
    _txtUserName.textColor = [UIColor purpleColor];
    _txtUserName.placeholder = @"请输入邮箱/手机号";
    _txtUserName.layer.cornerRadius = 6.0f;
    _txtUserName.layer.borderColor  = [UIColor whiteColor].CGColor;
    _txtUserName.layer.borderWidth  = 1.0f;
    _txtUserName.autocorrectionType = UITextAutocorrectionTypeNo;//纠错
    _txtUserName.autocapitalizationType = UITextAutocapitalizationTypeNone;//首字母大写
    _txtUserName.returnKeyType = UIReturnKeyGo;//return键的显示方式
    _txtUserName.leftViewMode  = UITextFieldViewModeAlways;
    _txtUserName.leftView = ({
        CGRect frame = [_txtUserName frame];
        frame.size.width = 7.0f;
        UIView *leftview = [[UIView alloc] initWithFrame:frame];
        leftview;
    });
    
    [_txtUserName addTarget:self action:@selector(textFieldChanged) forControlEvents:UIControlEventEditingChanged];
    
    [self.view addSubview:_txtUserName];
    
    _btnLogin = [[UIButton alloc] init];
    _btnLogin.frame = (CGRect){80,400,240,45};
    _btnLogin.backgroundColor = [UIColor yellowColor];
    [_btnLogin setTitle:@"登  录" forState:UIControlStateNormal];
    [_btnLogin setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [_btnLogin setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [_btnLogin addTarget:self action:@selector(touchLogin:) forControlEvents:UIControlEventTouchUpInside];
    _btnLogin.layer.cornerRadius = 6.0f;
    _btnLogin.enabled = NO;
    [self.view addSubview:_btnLogin];
}

- (void)touchUserIco:(UITapGestureRecognizer *)tapPress {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    animation.keyPath = @"transform.rotation";
    animation.values = @[@(angle2Radian(-5)),@(angle2Radian(5)),@(0)];
    animation.duration = 0.4;
    animation.repeatCount = 1;
    
    [_userIco.layer addAnimation:animation forKey:nil];
}

- (void)touchLogin:(UIButton *)sender {
    
//    if([_txtUserName.text isEqualToString:@"wangjhstc"]) {
//        [self animationGroup];
//    }
//    else {
//        [self wiggleControl:_txtUserName];
//        
//        [_txtUserName setText:@""];
//        [_txtUserName setValue:[UIColor yellowColor] forKeyPath:@"_placeholderLabel.textColor"];
//        _btnLogin.enabled = NO;
//    //    [_txtUserName setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];//限定字号
//    }
    
    
    
    __weak typeof(self) weakself = self;
    

    dispatch_barrier_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"--1");
        [weakself testInvocation:-1];
    });
    
    dispatch_barrier_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"--2");
        [weakself testInvocation:-2];
    });
    
    dispatch_barrier_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"--3");
        [weakself testInvocation:-3];
    });
    
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [weakself testInvocation:1];
//    });
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [weakself testInvocation:2];
//    });
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [weakself testInvocation:3];
//    });
    
}

- (void)testInvocation:(NSInteger)tagParam {
    
    for (NSInteger index = 0; index < 1000; index ++) {
        
        
        @synchronized([[NSString alloc] init]) {
            
        }
        
        NSLog(@"%zi___%zi",tagParam,index);
//        NSMutableArray *array = [[NSMutableArray alloc] init];
//        LoginModel *loginModel = [[LoginModel alloc] init];
//        [array addObject:loginModel];
    }
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

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"text"]) {
        _btnLogin.enabled = _txtUserName.text.length > 0;
    }
}

- (void)textFieldChanged {
    if (_txtUserName.text.length > 20) {
        _txtUserName.text = [_txtUserName.text substringToIndex:20];
    }
    
    _btnLogin.enabled = _txtUserName.text.length > 0;
}

- (void)animationGroup {
//    CABasicAnimation *rotate = [CABasicAnimation animation];
//    rotate.keyPath = @"transform.rotation";
//    rotate.toValue = @M_PI_2;
    
    
//    CABasicAnimation *translate = [CABasicAnimation animation];
//    translate.keyPath = @"position";
//    translate.toValue = [NSValue valueWithCGPoint:CGPointMake(16, 64)];
    
    
//    CABasicAnimation *scale = [CABasicAnimation animation];
//    scale.keyPath = @"transform.scale";
//    scale.toValue = @0.5f;

    
//    [_userIco removeGestureRecognizer:tapPress];
    
    CABasicAnimation *scale = [CABasicAnimation animation];
    scale.keyPath = @"transform.scale";
    scale.toValue = @0.5f;
    
    CABasicAnimation *translateX = [CABasicAnimation animation];
    translateX.keyPath = @"position.x";
    translateX.toValue = @(16 + 25);

    CABasicAnimation *translateY = [CABasicAnimation animation];
    translateY.keyPath = @"position.y";
    translateY.toValue = @(64+25);
    
//    CABasicAnimation *frame = [CABasicAnimation animation];
//    frame.keyPath = @"frame";
//    frame.toValue = [NSValue valueWithCGRect:CGRectMake(16, 64, 100, 100)];

    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    
    animationGroup.animations = @[scale,translateX,translateY];
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeForwards;
    
    [_userIco.layer addAnimation:animationGroup forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
}

@end
