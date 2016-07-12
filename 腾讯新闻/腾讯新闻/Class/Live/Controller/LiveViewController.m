//
//  LiveViewController.m
//  腾讯新闻
//
//  Created by 李想 on 16/7/8.
//  Copyright © 2016年 李想. All rights reserved.
//

#import "LiveViewController.h"

@interface LiveViewController ()

@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    [self setNavigation];
}

- (void)setNavigation {
    self.navigationItem.title = @"直播";
    
    UIImage *rightImage = [[UIImage imageNamed:@"search_icon_btn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *searchButtonItem = [[UIBarButtonItem alloc] initWithImage:rightImage style:UIBarButtonItemStylePlain target:self action:@selector(clickSearchButton:)];
    
    self.navigationItem.rightBarButtonItem = searchButtonItem;
}

- (void)clickSearchButton:(UIButton *)searchButton {
    
}

@end
