//
//  main.m
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/15.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    // 创建UIApplication对象6    //　创建AppDelegate对象 加载info。plist  开启主程序循环  加载主 nib文件  还有 principalclass文件
    // main storyBoard  1.初始化窗口  2.加载其他storyBoard 3.初始化控制器 （箭头指向的）
    
    @autoreleasepool {
       
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
