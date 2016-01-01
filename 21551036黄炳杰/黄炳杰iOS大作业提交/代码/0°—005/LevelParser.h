//
//  LevelParser.h
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//
//

#import <Foundation/Foundation.h>

@class Levels;

@interface LevelParser : NSObject{}

+(Levels *)loadLevelsForChapter:(int)chapter;

+(void)saveData:(Levels *)saveData forChapter:(int)chapter;

@end
