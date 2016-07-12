//
//  NanjingViewController.m
//  腾讯新闻
//
//  Created by 李想 on 16/7/11.
//  Copyright © 2016年 李想. All rights reserved.
//

#import "NanjingViewController.h"
#import "News.h"
#import "NewsTableViewCell.h"
#import "HeaderTableViewCell.h"

#import "SDCycleScrollView.h"

#import "MJRefresh.h"
@interface NanjingViewController ()<UITableViewDelegate, UITableViewDataSource, SDCycleScrollViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@property (nonatomic, strong) NSArray *allNews;

@end

@implementation NanjingViewController

- (NSArray *)allNews
{
    if (!_allNews) {
        _allNews = [News demoData];
    }
    return _allNews;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor colorWithWhite:0.600 alpha:1.000];
    
    [self createTableView];
    
    [self setSDCycleScrollView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"HeaderCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"NewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"NewsCell"];
}

#pragma mark - SDCycleScrollView
- (void)setSDCycleScrollView
{
    // 情景一：采用本地图片实现
    NSArray *images = @[[UIImage imageNamed:@"111.jpg"],
                        [UIImage imageNamed:@"222.jpg"],
                        [UIImage imageNamed:@"333.jpg"],
                        [UIImage imageNamed:@"444.jpg"]
                        ];
    //SDCycleScrollView *cycleScrollView = [[SDCycleScrollView alloc]init];
    
    // 本地加载 --- 创建不带标题的图片轮播器
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 210) imageNamesGroup:images];
    
    _cycleScrollView.infiniteLoop = YES;
    _cycleScrollView.delegate = self;
    _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    
    [self.view addSubview:_cycleScrollView];
    //         --- 轮播时间间隔，默认1.0秒，可自定义
    //self.cycleScrollView.autoScrollTimeInterval = 0.5;
}

#pragma mark - TableView
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
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //产生一个cell对象   先尝试看队列里有没有已经回收的可重用的单元格对象
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    //如果没有取到cell，再新建
    if (cell == nil)
    {
        cell=[[NewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell"];
    }
    
    switch (indexPath.row) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"HeaderCell" forIndexPath:indexPath];
            //cell = tableView.tableHeaderView;
            
            [cell addSubview:self.cycleScrollView];
            break;
            
        default:
            cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
            //按照行号，找到该行对应的新闻对象
            News *news = self.allNews[indexPath.row];
            
            //将新闻对象传给cell，进行显示
            cell.news = news;
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 210;
    }
    else
    {
        return 85;
    }
}

@end
