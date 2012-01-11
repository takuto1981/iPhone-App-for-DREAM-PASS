//
//  HttpClient.h
//  INTRO
//
//  Created by 兼平 卓史 on 11/11/26.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpClient : NSObject

+ (void)request:(NSURLRequest *)request success:(void (^)(NSData *))onSuccess error:(void (^)(NSError *))onError;

@end