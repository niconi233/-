//
//  DataSevice.h
//  项目三-附近游
//
//  Created by huiwenjiaoyu on 15/9/9.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^BlockType)(id result);

@interface DataSevice : NSObject

+ (AFHTTPRequestOperation *)requestAFUrl:(NSString*)urlString
                              httpMethod:(NSString*)method
                                  params:(NSMutableDictionary*)params
                                    data:(NSMutableDictionary*)datas
                                   block:(BlockType)block;


+ (void)request: (NSString*)httpUrl
    withHttpArg: (NSString*)HttpArg
          block:(BlockType)block;//接收到数据的处理

@end
