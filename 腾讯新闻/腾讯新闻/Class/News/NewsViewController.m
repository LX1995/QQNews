//
//  NewsViewController.m
//  腾讯新闻
//
//  Created by 李想 on 16/7/11.
//  Copyright © 2016年 李想. All rights reserved.
//

#import "NewsViewController.h"



#import "JiangsuViewController.h"
#import "NanjingViewController.h"
#import "YaowenViewController.h"
#import "ShehuiViewController.h"
#import "ShishangViewController.h"
#import "CarViewController.h"
#import "KejiViewController.h"


#import "LRLChannelEditController.h"

@interface NewsViewController ()

//@property (nonatomic, strong) UIView *navView;
@property (nonatomic, strong) NSMutableArray<ChannelUnitModel *> *topChannelArr;

@property (nonatomic, strong) NSMutableArray<ChannelUnitModel *> *bottomChannelArr;

@property (nonatomic, assign) NSInteger chooseIndex;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigation];

    [self setUpAllViewController];
    
    printMessage ();
    
}

void (^printMessage)(void) = ^(void)
{
    NSLog(@"Programming is fun.");
};



- (void)setUpAllViewController
{

    JiangsuViewController *jiangsuVC = [[JiangsuViewController alloc] init];
    jiangsuVC.title = @"江苏";
    [self addChildViewController:jiangsuVC];
    
    NanjingViewController *nanjingVC = [[NanjingViewController alloc] init];
    nanjingVC.title = @"南京";
    [self addChildViewController:nanjingVC];
    
    YaowenViewController *yaowenVC = [[YaowenViewController alloc] init];
    yaowenVC.title = @"要闻";
    [self addChildViewController:yaowenVC];
    
    ShehuiViewController *shehuiVC = [[ShehuiViewController alloc] init];
    shehuiVC.title = @"社会";
    [self addChildViewController:shehuiVC];
    
    ShishangViewController *shishangVC = [[ShishangViewController alloc] init];
    shishangVC.title = @"时尚";
    [self addChildViewController:shishangVC];
    
    CarViewController *carVC = [[CarViewController alloc] init];
    carVC.title = @"汽车";
    [self addChildViewController:carVC];
    
    KejiViewController *kejiVC = [[KejiViewController alloc] init];
    kejiVC.title = @"科技";
    [self addChildViewController:kejiVC];
    
    //标题渐变
    //self.isShowTitleGradient = YES;
    self.titleColorGradientStyle = YZTitleColorGradientStyleFill;
    //self.titleColorGradientStyle = YZTitleColorGradientStyleRGB;
    self.titleScrollViewColor = [UIColor clearColor];
    self.endR = 0;
    
    //self.isShowTitleScale = YES;
    
    //self.titleScale = 3;
    
    //下滑线
    self.isShowUnderLine = YES;
    self.underLineColor = [UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:1.000];
}

#pragma mark - Navigation
- (void)setNavigation {
    
    UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickAddButton:)];
    
    self.navigationItem.rightBarButtonItem = addButtonItem;
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    //[self.navigationController.navigationBar addSubview:];
    
}

#pragma mark - 排序
-(NSMutableArray<ChannelUnitModel *> *)topChannelArr {
    if (!_topChannelArr) {
        //这里模拟从本地获取的频道数组
        _topChannelArr = [NSMutableArray array];
        for (int i = 0; i < 20; ++i) {
            ChannelUnitModel *channelModel = [[ChannelUnitModel alloc] init];
            channelModel.name = [NSString stringWithFormat:@"标题%d", i];
            channelModel.cid = [NSString stringWithFormat:@"%d", i];
            channelModel.isTop = YES;
            [_topChannelArr addObject:channelModel];
        }
    }
    return _topChannelArr;
}
-(NSMutableArray<ChannelUnitModel *> *)bottomChannelArr {
    if (!_bottomChannelArr) {
        _bottomChannelArr = [NSMutableArray array];
        for (int i = 10; i < 20; ++i) {
            ChannelUnitModel *channelModel = [[ChannelUnitModel alloc] init];
            channelModel.name = [NSString stringWithFormat:@"标题%d", i];
            channelModel.cid = [NSString stringWithFormat:@"%d", i];
            channelModel.isTop = NO;
            [_bottomChannelArr addObject:channelModel];
        }
        
    }
    return _bottomChannelArr;
}

- (void)clickAddButton:(UIButton *)addButton {
    LRLChannelEditController *channelEdit = [[LRLChannelEditController alloc] initWithTopDataSource:self.topChannelArr andBottomDataSource:self.bottomChannelArr andInitialIndex:self.chooseIndex];
    
    //编辑后的回调
    __weak NewsViewController *weakSelf = self;
    channelEdit.removeInitialIndexBlock = ^(NSMutableArray<ChannelUnitModel *> *topArr, NSMutableArray<ChannelUnitModel *> *bottomArr) {
        weakSelf.topChannelArr = topArr;
        weakSelf.bottomChannelArr = bottomArr;
        NSLog(@"删除了初始选中项的回调:\n保留的频道有: %@", topArr);
    };
    channelEdit.chooseIndexBlock = ^(NSInteger index, NSMutableArray<ChannelUnitModel *> *topArr, NSMutableArray<ChannelUnitModel *> *bottomArr) {
        weakSelf.topChannelArr = topArr;
        weakSelf.bottomChannelArr = bottomArr;
        weakSelf.chooseIndex = index;
        NSLog(@"选中了某一项的回调:\n保留的频道有: %@, 选中第%ld个频道", topArr, index);
    };
    
    channelEdit.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:channelEdit animated:YES completion:nil];
}






@end
