//
//  News.m
//  Model
//
//  Created by qiyu on 2019/11/29.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "News.h"

@interface News ()

@property (nonatomic, strong) NSArray *pics;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *times;
@property (nonatomic, strong) NSArray *contents;

@property (nonatomic, strong) NSMutableArray *news;

@end

@implementation News

- (NSMutableArray *)news {
    
    if (_news == nil) {
        _news = [NSMutableArray array]; //构造
        for (int i = 0; i < self.pics.count; ++i) {
            News *temp = [[News alloc] init];
            temp.picName = self.pics[i];
            temp.titleText = self.titles[i];
            temp.timeText = self.times[i];
            temp.contentText = self.contents[i];
            [_news addObject:temp];
        }
    }
    return _news;
}

- (NSArray *)pics {
    if (_pics == nil) {
        _pics = @[@"材料跟踪", @"进度计划", @"任务-蓝", @"任务", @"日历", @"项目动态", @"项目信息", @"项目云盘", @"周报"];
    }
    return _pics;
}

- (NSArray *)titles {
    if (_titles == nil) {
        _titles = @[@"材料跟踪", @"进度计划", @"任务-蓝", @"任务", @"日历", @"项目动态", @"项目信息", @"项目云盘", @"周报"];
    }
    return _titles;
}

- (NSArray *)times {
    if (_times == nil) {
        _times = @[@"10:11", @"10:12", @"10:13", @"10:14", @"10:15", @"10:16", @"10:17", @"10:18", @"10:19"];
    }
    return _times;
}

- (NSArray *)contents {
    if (_contents == nil) {
        _contents = @[@"这里是内容", @"这里是内容", @"这里是内容", @"这里是内容", @"这里是内容", @"这里是内容", @"这里是内容", @"这里是内容", @"这里是内容"];
    }
    return _contents;
}

- (NSMutableArray *)getModels {
    return self.news;
}

@end
