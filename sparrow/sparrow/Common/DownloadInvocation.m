//
//  DownloadInvocation.m
//  sparrow
//
//  Created by microsparrow on 16/2/3.
//  Copyright © 2016年 xkeshi. All rights reserved.
//

#import "DownloadInvocation.h"
//#import <AFNetworking/AFNetworking.h>


@implementation DownloadInvocation

- (void)download {
    
}

//- (void)download {
//    NSString *savedPath = [NSHomeDirectory() stringByAppendingString:@"/Documents/QQ7.6.exe"];
//
//    [self downloadFileWithOption:@{@"userid":@"123123"}
//                   withInferface:@"http://dldir1.qq.com/qqfile/qq/QQ7.6/15742/QQ7.6.exe"
//                       savedPath:savedPath
//                 downloadSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//                     
//                 } downloadFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                     
//                 } progress:^(float progress) {
//                     
//                 }];
//}
//
//
//- (void)downloadFileWithOption:(NSDictionary *)paramDic
//                 withInferface:(NSString*)requestURL
//                     savedPath:(NSString*)savedPath
//               downloadSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
//               downloadFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
//                      progress:(void (^)(float progress))progress
//
//{
//    
//    //沙盒路径    //NSString *savedPath = [NSHomeDirectory() stringByAppendingString:@"/Documents/xxx.zip"];
//    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
//    NSMutableURLRequest *request =[serializer requestWithMethod:@"POST" URLString:requestURL parameters:paramDic error:nil];
//    
//    //以下是手动创建request方法 AFQueryStringFromParametersWithEncoding有时候会保存
//    //    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:requestURL]];
//    //   NSMutableURLRequest *request =[[[AFHTTPRequestOperationManager manager]requestSerializer]requestWithMethod:@"POST" URLString:requestURL parameters:paramaterDic error:nil];
//    //
//    //    NSString *charset = (__bridge NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
//    //
//    //    [request setValue:[NSString stringWithFormat:@"application/x-www-form-urlencoded; charset=%@", charset] forHTTPHeaderField:@"Content-Type"];
//    //    [request setHTTPMethod:@"POST"];
//    //
//    //    [request setHTTPBody:[AFQueryStringFromParametersWithEncoding(paramaterDic, NSASCIIStringEncoding) dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
//    [operation setOutputStream:[NSOutputStream outputStreamToFileAtPath:savedPath append:NO]];
//    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
//        float p = (float)totalBytesRead / totalBytesExpectedToRead;
//        progress(p);
//        NSLog(@"download：%f", (float)totalBytesRead / totalBytesExpectedToRead);
//        
//    }];
//    
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        success(operation,responseObject);
//        NSLog(@"下载成功");
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        success(operation,error);
//        
//        NSLog(@"下载失败");
//        
//    }];
//    
//    [operation start];
//}

@end
