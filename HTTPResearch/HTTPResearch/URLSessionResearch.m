//
//  URLSessionResearch.m
//  HTTPResearch
//
//  Created by qiyu on 2020/1/6.
//  Copyright © 2020 com.qiyu. All rights reserved.
//

#import "URLSessionResearch.h"

@interface URLSessionResearch () <NSURLSessionDataDelegate>

@end

@implementation URLSessionResearch

/* Sent when data is available for the delegate to consume.  It is
 * assumed that the delegate will retain and not copy the data.  As
 * the data may be discontiguous, you should use
 * [NSData enumerateByteRangesUsingBlock:] to access it.
 */
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data {
    
}

@end
