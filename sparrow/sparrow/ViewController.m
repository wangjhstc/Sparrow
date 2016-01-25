//
//  ViewController.m
//  sparrow
//
//  Created by microsparrow on 16/1/25.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "ViewController.h"
#import "inheritView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    awakeNibView *anibView = [[awakeNibView alloc] init];
////    anibView.frame = (CGRect){0,0,200,120};
//    anibView.backgroundColor = [UIColor yellowColor];
//    
//    [self.view addSubview:anibView];
    
    
    inheritView *inher = [[inheritView alloc] init];
    inher.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:inher];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
