//
//  News.h
//  朵诺新闻
//
//  Created by 李想 on 16/6/29.
//  Copyright © 2016年 李想. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

//新闻主图片
@property(nonatomic,strong)NSString *imageName;

//新闻主标题
@property(nonatomic,strong)NSString *title;

//网站名
@property (nonatomic, strong) NSString *netName;

//评论数label
@property (nonatomic) NSInteger commentNumber;

//时间
@property (nonatomic, strong) NSString *newsTime;

+(NSArray *)demoData;

@end
