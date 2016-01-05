//
//  Chapter.h
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//
//

#import <Foundation/Foundation.h>

@interface Chapter : NSObject{
    NSString *_name;
    int _number;
    BOOL _unlocked;
}

@property (nonatomic, copy)NSString *name;
@property (nonatomic, assign) int number;
@property (nonatomic, assign) BOOL unlocked;


//自定义的初始化方法
-(id)initWithName:(NSString*)name number:(int)number  unlocked:(BOOL)unlocked;

@end
