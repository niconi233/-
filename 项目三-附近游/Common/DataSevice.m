//
//  DataSevice.m
//  项目三-附近游
//
//  Created by huiwenjiaoyu on 15/9/9.
//  Copyright (c) 2015年 huiwenjiaoyu. All rights reserved.
//

#import "DataSevice.h"
#import "Common.h"

@implementation DataSevice

+ (void)request: (NSString*)httpUrl withHttpArg: (NSString*)HttpArg block:(BlockType)block  {
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, HttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue: myApikey forHTTPHeaderField: @"apikey"];
     
    [NSURLConnection sendAsynchronousRequest: request
                                       queue: [NSOperationQueue mainQueue]
                           completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
                               if (error!=nil) {
                                   NSLog(@"网络请求失败!");
                               }
                               
                               id reslut = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                               if (block) {
                                   block(reslut);
                               }
                               
                           }];
     
     
}

+ (AFHTTPRequestOperation *)requestAFUrl:(NSString *)urlString httpMethod:(NSString *)method params:(NSMutableDictionary *)params data:(NSMutableDictionary *)datas block:(BlockType)block {
    [params setObject:myKey forKey:@"key"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    if ([method isEqualToString:@"GET"]) {
        AFHTTPRequestOperation *operation = [manager GET:urlString parameters:params success:^(AFHTTPRequestOperation * operation, id responseObject) {
            
            block (responseObject);
            
        } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
            
            NSLog(@"失败");
        }];
        
        return operation;

    }else{//不带图片
        
        AFHTTPRequestOperation *operation =  [manager POST:urlString parameters:params success:^void(AFHTTPRequestOperation *operation , id responseObject ) {
            NSLog(@"POST成功");
            
            block(responseObject);
            
        } failure:^void(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];
        
        return  operation;
        
    }

    
    return nil;
    
 
}

@end
