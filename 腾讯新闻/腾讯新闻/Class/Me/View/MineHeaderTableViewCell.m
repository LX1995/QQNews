//
//  HeaderTableViewCell.m
//  腾讯新闻
//
//  Created by 李想 on 16/7/11.
//  Copyright © 2016年 李想. All rights reserved.
//

#import "MineHeaderTableViewCell.h"

@interface MineHeaderTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *NightModeButton;


@property (weak, nonatomic) IBOutlet UIButton *TextModeButton;

@property (weak, nonatomic) IBOutlet UIButton *OfflineReadingButton;

@end

@implementation MineHeaderTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)NightModeButton:(id)sender {

    NSLog(@"%@点击了", _NightModeButton);
}
- (IBAction)TextModeButton:(id)sender {
}
- (IBAction)OfflineReadingButton:(id)sender {
}

@end
