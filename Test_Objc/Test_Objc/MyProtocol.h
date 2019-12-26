//
//  MyProtocol.h
//  Test_Objc
//
//  Created by qiyu on 2019/11/20.
//  Copyright © 2019 com.qiyu. All rights reserved.
//

#ifndef MyProtocol_h
#define MyProtocol_h

@protocol MyProtocol <NSObject>

@required
@property NSString *myStr;
- (void)Print:(NSString *)text;

@end


#endif /* MyProtocol_h */
