//
//  MeViewController.m
//  腾讯新闻
//
//  Created by 李想 on 16/7/8.
//  Copyright © 2016年 李想. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createTableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MineHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"MineHeaderCell"];
    
    //隐藏导航栏
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
    //[self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
    //self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
//    UIImage *image = [UIImage imageNamed:@"bg_clear"];
//    [self.navigationController.navigationBar setBackgroundImage:image
//                                                  forBarMetrics:UIBarMetricsCompact];
    
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
    
    //self.tableView.backgroundView = nil;
    
}



#pragma mark - 三问一答

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    //右边小箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    switch (indexPath.row) {
            
        case 0:
                cell = [tableView dequeueReusableCellWithIdentifier:@"MineHeaderCell" forIndexPath:indexPath];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            break;
            
        case 1:
                cell.textLabel.text = @"我的关注";
            break;
            
        case 2:
                cell.textLabel.text = @"我的收藏";
            break;
            
        case 3:
                cell.textLabel.text = @"我的评论";
            break;
            
        case 4:
                cell.textLabel.text = @"游戏";
            break;
            
        case 5:
                cell.textLabel.text = @"意见反馈";
            break;
            
        default:
            break;
    }

    
    return cell;
}

#pragma mark - cell行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 250;
    }
    else
    {
        return 55;
    }
}


@end
