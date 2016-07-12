//
//  RecommendViewController.m
//  腾讯新闻
//
//  Created by 李想 on 16/7/8.
//  Copyright © 2016年 李想. All rights reserved.
//

#import "RecommendViewController.h"

#import "MJRefresh.h"

@interface RecommendViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    [self setNavigation];
    
    [self createTableView];
}

- (void)setNavigation {
    self.navigationItem.title = @"推荐";
    
    UIImage *rightImage = [[UIImage imageNamed:@"search_icon_btn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *searchButtonItem = [[UIBarButtonItem alloc] initWithImage:rightImage style:UIBarButtonItemStylePlain target:self action:@selector(clickSearchButton:)];
    
    self.navigationItem.rightBarButtonItem = searchButtonItem;
}

- (void)clickSearchButton:(UIButton *)searchButton {
    
}

#pragma mark - tableView
- (void)createTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //self.tableView.tableHeaderView = _cycleScrollView;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.view addSubview:self.tableView];
    
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
    }];
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    
    //上拉加载
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
    }];
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

#pragma mark - 下拉刷新
- (void)loadNewData
{
    [self.tableView.mj_header endRefreshing];
}
#pragma mark - 上拉加载
- (void)loadMoreData
{
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark - 三问一答
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
