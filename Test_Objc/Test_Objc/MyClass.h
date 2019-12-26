//
//  MyClass.h
//  Test_Objc
//
//  Created by qiyu on 2019/11/20.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyClass : NSObject <MyProtocol>

- (id)initWithStr:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
