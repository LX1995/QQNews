//
//  News.m
//  朵诺新闻
//
//  Created by 李想 on 16/6/29.
//  Copyright © 2016年 李想. All rights reserved.
//

#import "News.h"

@implementation News

+ (NSArray *)demoData
{
    News *n1 = [[News alloc]init];
    n1.imageName = @"视觉";
    n1.title = @"看看鲁豫的朋友圈，这才叫国际范儿";
    n1.netName = @"光明网";
    n1.newsTime = @"6-21 12:40";
    n1.commentNumber = 48;
    
    News *n2 = [[News alloc]init];
    n2.imageName = @"A00BB501B8B8D0205F830837C89100FF";
    n2.title = @"南京朵诺信息科技有限公司";
    n2.netName = @"朵诺网";
    n2.newsTime = @"6-21 12:40";
    n2.commentNumber = 148;
    
    News *n3 = [[News alloc]init];
    n3.imageName = @"A316AE1FB16D1765A613494037A1D437";
    n3.title = @"江苏省进入梅雨季节";
    n3.netName = @"天气网";
    n3.newsTime = @"6-21 12:40";
    n3.commentNumber = 504;
    
    News *n4 = [[News alloc]init];
    n4.imageName = @"D4EC45B5574FD018070B8D06613A002C";
    n4.title = @"淮安信息职业技术学院";
    n4.netName = @"学信网";
    n4.newsTime = @"6-21 12:40";
    n4.commentNumber = 772;
    
    News *n5 = [[News alloc]init];
    n5.imageName = @"F6D9A85A45A333A49D4B9ADBA81CB6E7";
    n5.title = @"邳州市第二中学";
    n5.netName = @"邳州网";
    n5.newsTime = @"6-21 12:40";
    n5.commentNumber = 907;
    
    News *n6 = [[News alloc]init];
    n6.imageName = @"F51DAC9BD310292D893475B9E6F7DC60";
    n6.title = @"南京达内科技集团";
    n6.netName = @"达内网";
    n6.newsTime = @"6-21 12:40";
    n6.commentNumber = 103;
    
    News *n7 = [[News alloc]init];
    n7.imageName = @"ghost";
    n7.title = @"apple推出iPhone 7";
    n7.netName = @"苹果网";
    n7.newsTime = @"6-21 12:40";
    n7.commentNumber = 10223;
    
    News *n8 = [[News alloc]init];
    n8.imageName = @"Mac OS";
    n8.title = @"李想李想李想";
    n8.netName = @"李想网";
    n8.newsTime = @"6-21 12:40";
    n8.commentNumber = 10223;
    
    News *n9 = [[News alloc]init];
    n9.imageName = @"photo_1";
    n9.title = @"耳机我搜齐全";
    n9.netName = @"达内网";
    n9.newsTime = @"6-21 12:40";
    n9.commentNumber = 1023;
    
    return @[n1, n2, n3, n4, n5, n6, n7, n8, n9];
}

@end
