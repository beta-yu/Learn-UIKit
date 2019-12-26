//
//  SecondViewController.h
//  ControllerBackPassValue
//
//  Created by qiyu on 2019/12/2.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import <UIKit/UIKit.h>

//1.定义协议
@protocol PassValueProtocol <NSObject>

- (void)passValue:(NSString *_Nullable)info;

@end


NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController

//2.声明代理属性
@property (nonatomic, assign) id<PassValueProtocol> delegate;

@end

NS_ASSUME_NONNULL_END
