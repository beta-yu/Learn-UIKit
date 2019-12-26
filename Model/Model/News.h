//
//  News.h
//  Model
//
//  Created by qiyu on 2019/11/29.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface News : NSObject

@property (nonatomic, copy) NSString *picName;
@property (nonatomic, copy) NSString *titleText;
@property (nonatomic, copy) NSString *timeText;
@property (nonatomic, copy) NSString *contentText;

- (NSMutableArray *)getModels;
@end

NS_ASSUME_NONNULL_END
