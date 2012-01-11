//
//  HttpClient.m
//  INTRO
//
//  Created by 兼平 卓史 on 11/11/26.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "HttpClient.h"

@implementation HttpClient

+ (void)request:(NSURLRequest *)request success:(void (^)(NSData *))onSuccess error:(void (^)(NSError *))onError {
    dispatch_queue_t q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q, ^{
        NSURLResponse *response = nil;
        NSError       *error    = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:&response
                                                         error:&error];
        if (error) {
            onError(error);
        } else {
            onSuccess(data);
        }
    });
}

@end