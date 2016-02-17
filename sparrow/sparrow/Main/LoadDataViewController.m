//
//  LoadDataViewController.m
//  sparrow
//
//  Created by microsparrow on 16/2/3.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "LoadDataViewController.h"

@interface LoadDataViewController ()

@property   (nonatomic,strong)  NSMutableArray  *dataArray;

@end

@implementation LoadDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text   = @"";
    
    return cell;
}

@end
