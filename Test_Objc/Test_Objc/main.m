//
//  main.m
//  Test_Objc
//
//  Created by qiyu on 2019/11/20.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        MyClass *obj = [[MyClass alloc] initWithStr:@"Hello world!"];
        [obj Print:obj.myStr];
    }
    return 0;
}
