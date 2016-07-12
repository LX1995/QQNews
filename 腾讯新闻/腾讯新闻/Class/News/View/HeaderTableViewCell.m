//
//  HeaderTableViewCell.m
//  朵诺新闻
//
//  Created by 李想 on 16/6/29.
//  Copyright © 2016年 李想. All rights reserved.
//

#import "HeaderTableViewCell.h"
//#import "SDCycleScrollView.h"

@interface HeaderTableViewCell ()<UIScrollViewDelegate>

//@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

//@property(nonatomic,weak)UIPageControl *pageControl;
//
//@property (nonatomic,strong)NSTimer *timer;
//
//@property (nonatomic,assign) BOOL isDragging;
@end

@implementation HeaderTableViewCell

- (void)awakeFromNib {
    // Initialization code
       // 情景一：采用本地图片实现
//    NSArray *images = @[[UIImage imageNamed:@"杭州西湖1.jpg"],
//                        [UIImage imageNamed:@"杭州西湖2.jpg"],
//                        [UIImage imageNamed:@"杭州西湖3.jpg"],
//                        [UIImage imageNamed:@"杭州西湖4.jpg"]
//                        ];
//    
//    
//    // 本地加载 --- 创建不带标题的图片轮播器
//    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) imageNamesGroup:images];
//    
//    cycleScrollView.infiniteLoop = YES;
//    cycleScrollView.delegate = self;
//    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
//
//    [self addSubview:cycleScrollView];
    //         --- 轮播时间间隔，默认1.0秒，可自定义
    //cycleScrollView.autoScrollTimeInterval = 0.5;
    
}
#pragma mark - SDCycleScrollViewDelegate
//
//- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
//{
//    NSLog(@"---点击了第%ld张图片", index);
//}
//- (void)update:(NSTimer *)timer{
//    //定时移动
//    
//    if (_isDragging == YES) {
//        return ;
//    }
//    CGPoint offSet = self.scrollView.contentOffset;
//    offSet.x +=offSet.x;
//    [self.scrollView setContentOffset:offSet animated:YES];
//    
//    if (offSet.x >= self.frame.size.width *2) {
//        offSet.x = self.frame.size.width;
//    }
//    
//    
//}

//#pragma mark - UIScrollViewDelegate
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
//{
//    _isDragging = YES;
//}
////  停止滚动
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    _isDragging = NO;
//    //step = 0;
//}

//#pragma mark - 圆点
////圆点
//-(void)setupPageControl
//{
//    //1.创建实例
//    UIPageControl *pageControl=[[UIPageControl alloc]init];
//    self.pageControl=pageControl;
//    
//    //2.设置frame
//    pageControl.frame=CGRectMake(0, self.frame.size.height-60,self.frame.size.width, 60);
//    
//    //3.添加pageControl到控制器的View里，滚动到哪都能看见
//    [self addSubview:pageControl];
//    
//    //4.pageControl其他设置
//    //4.1数目
//    pageControl.numberOfPages=4;
//    //4.2圆点颜色
//    //pageControl.pageIndicatorTintColor=[UIColor blackColor];
//    //4.3设置被选中圆点颜色
//    //pageControl.currentPageIndicatorTintColor=[UIColor redColor];
//    //设置某点被选中
//    //pageControl.currentPage=1;
//    //4.5设置pagecontrol不与用户交互
//    pageControl.userInteractionEnabled=NO;
//    
//}

@end
