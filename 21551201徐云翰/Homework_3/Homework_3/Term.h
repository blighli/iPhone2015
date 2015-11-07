//
//  Term.h
//  Homework_3
//
//  Created by YunhanXu on 15/11/1.
//  Copyright © 2015年 YunhanXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Term : UIView
@property (nonatomic,copy) NSString* inputString;
+(instancetype)addWithDict:(NSDictionary*)dict;
-(instancetype)init:(NSDictionary*)dict;
-(NSDictionary*)getDictionary;
@end
