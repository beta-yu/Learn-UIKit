//
//  NewsTableViewCell.m
//  Model
//
//  Created by qiyu on 2019/11/29.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCell:(News *)news {
    self.pic.image = [UIImage imageNamed:news.picName];
    self.title.text = news.titleText;
    self.time.text = news.timeText;
    self.content.text = news.contentText;
}

@end
