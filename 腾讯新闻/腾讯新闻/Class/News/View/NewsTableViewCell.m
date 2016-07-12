//
//  NewsTableViewCell.m
//  朵诺新闻
//
//  Created by 李想 on 16/6/29.
//  Copyright © 2016年 李想. All rights reserved.
//

#import "NewsTableViewCell.h"

@interface NewsTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *newsLabel;

@property (weak, nonatomic) IBOutlet UILabel *netNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@property (weak, nonatomic) IBOutlet UIImageView *newsImageView;

//@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@end

@implementation NewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setNews:(News *)news
{
    _news = news;
    //将数据显示到各个子控件上
    self.newsImageView.image = [UIImage imageNamed:news.imageName];
    self.newsLabel.text = news.title;
    self.netNameLabel.text = news.netName;
    self.commentLabel.text = [NSString stringWithFormat:@"%ld",news.commentNumber];
}

//- (IBAction)deleteButton:(id)sender {
    //开启表格的编辑模式,动画
    
    
//}
@end
