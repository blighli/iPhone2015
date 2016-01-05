//
//  ZXWeibo.m
//  Weibo_1
//
//  Created by zhengxiang on 15/12/16.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import "ZXWeibo.h"
#import "AppDelegate.h"
#import "AFNetworking.h"

@interface ZXWeibo()

@property (nonatomic, copy) NSString *filePath;

@end

@implementation ZXWeibo

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        _text = dict[@"weibo_text"];
        _nickname = dict[@"nickname"];
        _report_date = dict[@"report_date"];
        _user_id = dict[@"user_id"];
        _weibo_id = dict[@"id"];
        
        if ([[AppDelegate APP].hasImgDict objectForKey:_user_id] == nil) {
            [self getImg];
            [[AppDelegate APP].hasImgDict setObject:@"y" forKey:_user_id];
            NSLog(@"%@", [AppDelegate APP].hasImgDict);
        }

        
        //图片保存的路径

        NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/headImg%@", _user_id];
        
        //得到选择后沙盒中图片的完整路径
        _filePath = [[NSString alloc] initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
        _icon = _filePath;
        NSLog(@"user_id: %@ icon: %@", _user_id, _icon);
    }
    return self;
}

+ (instancetype)weiboWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (void)getImg
{
    //    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //    NSDictionary *parameters = @{@"user_id": _user_id};
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSString *urlString = [NSString stringWithFormat:@"http://127.0.0.1:8000/report/getHeadImg/%@/", _user_id];
    
    NSURL *URL = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSLog(@"targetPath: %@", targetPath);
        
        ////        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        //
        //        return [documentsDirectoryURL URLByAppendingPathComponent:[NSString stringWithFormat:@"headImg/%@/imag.png", _user_id]];
        
        //图片保存的路径
        
        NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/headImg%@", _user_id];
        
        //图片保存的路径
        //这里将图片放在沙盒的documents文件夹中
        
//        //文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
//        //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
//
        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
//
//        [fileManager createFileAtPath:[DocumentsPath stringByAppendingFormat: @"/image.png" ] contents:nil attributes:nil];
        
        //得到选择后沙盒中图片的完整路径
        _filePath = [[NSString alloc] initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
        //        NSString *str = [NSString stringWithFormat:@"file:///Users/zhengxiang/Downloads/tmp/%@.png", _user_id];
        NSString *str = [NSString stringWithFormat:@"file://%@", _filePath];
        
        return [NSURL URLWithString:str];
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"response: %@", response);
        NSLog(@"File downloaded to: %@", filePath);
        
    }];
    
    [downloadTask resume];
    
}

@end
