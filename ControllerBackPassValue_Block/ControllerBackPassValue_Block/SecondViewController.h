//
//  SecondViewController.h
//  ControllerBackPassValue_Block
//
//  Created by qiyu on 2019/12/2.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//定义Block
typedef void (^ PassValueBlock) (NSString *info);

@interface SecondViewController : UIViewController

//声明属性
@property (nonatomic, copy) PassValueBlock passValueBlock;

@end

NS_ASSUME_NONNULL_END
