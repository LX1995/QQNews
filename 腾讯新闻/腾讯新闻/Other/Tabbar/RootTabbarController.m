//
//  RootTabbarController.m
//  腾讯新闻
//
//  Created by 李想 on 16/7/8.
//  Copyright © 2016年 李想. All rights reserved.
//

#import "RootTabbarController.h"
#import "RootNavigationController.h"

#import "NewsViewController.h"
#import "RecommendViewController.h"
#import "LiveViewController.h"
#import "MeViewController.h"

@interface RootTabbarController ()

@end

@implementation RootTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITabBar *tabBar = [UITabBar appearance];
    
    tabBar.translucent = NO;
    
    tabBar.backgroundColor = [UIColor whiteColor];
    
    [self initializeComponent];
}

- (void)initializeComponent{
    
    [self addChildController:[[NewsViewController alloc] init] title:@"" image:@"tabbar_news_normal" selectedImage:@"tabbar_news_selected"];
    
    [self addChildController:[[RecommendViewController alloc] init] title:@"" image:@"tabbar_recommend_normal" selectedImage:@"tabbar_recommend_selected"];
    
    [self addChildController:[[LiveViewController alloc] init] title:@"" image:@"tabbar_live_normal" selectedImage:@"tabbar_live_selected"];
    
    [self addChildController:[[MeViewController alloc] init] title:@"" image:@"tabbar_me_normal" selectedImage:@"tabbar_me_selected"];
}

- (void)addChildController:(UIViewController *)viewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
    RootNavigationController *child = [[RootNavigationController alloc]initWithRootViewController:viewController];
    
    child.title = title;
    
    child.tabBarItem.image = [UIImage imageNamed:image];
    UIEdgeInsets inset = UIEdgeInsetsMake(5, 0, -5, 0);
    child.tabBarItem.imageInsets = inset;
    child.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    [self addChildViewController:child];
}

@end
