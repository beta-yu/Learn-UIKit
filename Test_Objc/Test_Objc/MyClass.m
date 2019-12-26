//
//  MyClass.m
//  Test_Objc
//
//  Created by qiyu on 2019/11/20.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

//Auto property synthesis will not synthesize property 'MyStr' declared in protocol 'MyProtocol'
@synthesize myStr = _myStr;

- (id)initWithStr:(NSString *)str {
    self = [super init];
    if (self) {
        _myStr = str;
    }
    return self;
}

- (void)Print:(NSString *)text {
    NSLog(@"%@", text);
}

@end
