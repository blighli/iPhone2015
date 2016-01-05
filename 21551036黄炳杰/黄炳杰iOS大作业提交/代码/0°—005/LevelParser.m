//
//  LevelParser.m
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//
//

#import "LevelParser.h"

#import "LevelParser.h"
#import "Levels.h"
#import "Level.h"
#import "GDataXMLNode.h"

@implementation LevelParser

+ (NSString *)dataFilePath:(BOOL)forSave forChapter:(int)chapter {
    
    NSString *xmlFileName = [NSString stringWithFormat:@"Levels-Chapter%i",chapter];
    
    
    NSString *xmlFileNameWithExtension = [NSString stringWithFormat:@"%@.xml",xmlFileName];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *documentsPath = [documentsDirectory stringByAppendingPathComponent:xmlFileNameWithExtension];
    if (forSave || [[NSFileManager defaultManager] fileExistsAtPath:documentsPath]) {
        return documentsPath;
        NSLog(@"%@ opened for read/write",documentsPath);
    } else {
        NSLog(@"Created/copied in default %@",xmlFileNameWithExtension);
        return [[NSBundle mainBundle] pathForResource:xmlFileName ofType:@"xml"];
    }
}

+ (Levels *)loadLevelsForChapter:(int)chapter {
    
    NSString *name;
    int number;
    BOOL unlocked;
    int stars;
    NSString *data;
    BOOL levelClear;
    
    
    
    Levels *levels = [[[Levels alloc] init] autorelease];
    
    // 创建 NSData 实例
    NSString *filePath = [self dataFilePath:FALSE forChapter:chapter];
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
    if (doc == nil) { return nil; NSLog(@"xml file is empty!");}
    NSLog(@"Loading %@", filePath);
    
    NSArray *dataArray = [doc nodesForXPath:@"//Levels/Level" error:nil];
    
    NSLog(@"Array Contents = %@", dataArray);
    
        
    for (GDataXMLElement *element in dataArray) {
        
        NSArray *nameArray = [element elementsForName:@"Name"];
        NSArray *numberArray = [element elementsForName:@"Number"];
        NSArray *unlockedArray = [element elementsForName:@"Unlocked"];
        NSArray *starsArray = [element elementsForName:@"Stars"];
        NSArray *dataArray= [element elementsForName:@"Data"];
        NSArray *levelClearArray = [element elementsForName:@"LevelClear"];
        
        
        
        // name
        if (nameArray.count > 0) {
            GDataXMLElement *nameElement = (GDataXMLElement *) [nameArray objectAtIndex:0];
            name = [nameElement stringValue];
        }
        
        // number
        if (numberArray.count > 0) {
            GDataXMLElement *numberElement = (GDataXMLElement *) [numberArray objectAtIndex:0];
            number = [[numberElement stringValue] intValue];
        }
        
        // unlocked
        if (unlockedArray.count > 0) {
            GDataXMLElement *unlockedElement = (GDataXMLElement *) [unlockedArray objectAtIndex:0];
            unlocked = [[unlockedElement stringValue] boolValue];
        }
        
        // stars
        if (starsArray.count > 0) {
            GDataXMLElement *starsElement = (GDataXMLElement *) [starsArray objectAtIndex:0];
            stars = [[starsElement stringValue] intValue];
        }
        
        // data
        if (dataArray.count > 0) {
            GDataXMLElement *dataElement = (GDataXMLElement *) [dataArray objectAtIndex:0];
            data = [dataElement stringValue];
        }
        
        //levelClear
        if(levelClearArray.count >0){
            GDataXMLElement *levelClearElement = (GDataXMLElement*)[levelClearArray objectAtIndex:0];
            levelClear = [[levelClearElement stringValue]boolValue];
        }
        
        
        Level *level = [[Level alloc] initWithName:name number:number unlocked:unlocked stars:stars data:data levelClear:levelClear];
        
        [levels.levels addObject:level];
    }
    
    [doc release];
    [xmlData release];
    return levels;
}

+ (void)saveData:(Levels *)saveData
      forChapter:(int)chapter {
    
    
    GDataXMLElement *levelsElement = [GDataXMLNode elementWithName:@"Levels"];
    
    for (Level *level in saveData.levels) {
        
        GDataXMLElement *levelElement = [GDataXMLNode elementWithName:@"Level"];
        
      
        GDataXMLElement *nameElement = [GDataXMLNode elementWithName:@"Name"
                                                         stringValue:level.name];
        
        GDataXMLElement *numberElement = [GDataXMLNode elementWithName:@"Number"
                                                           stringValue:[[NSNumber numberWithInt:level.number] stringValue]];
        
        GDataXMLElement *unlockedElement = [GDataXMLNode elementWithName:@"Unlocked" stringValue:[[NSNumber numberWithBool:level.unlocked] stringValue]];
        
        GDataXMLElement *starsElement = [GDataXMLNode elementWithName:@"Stars"
            stringValue:[[NSNumber numberWithInt:level.stars] stringValue]];
        
        GDataXMLElement *dataElement = [GDataXMLNode elementWithName:@"Data"
            stringValue:level.data];
        
       
        GDataXMLElement *levelClearElement = [GDataXMLNode elementWithName:@"LevelClear" stringValue:[[NSNumber numberWithInt:level.levelClear]stringValue]];
        
        
        
        [levelElement addChild:nameElement];
        [levelElement addChild:numberElement];
        [levelElement addChild:unlockedElement];
        [levelElement addChild:starsElement];
        [levelElement addChild:dataElement];
        [levelElement addChild:levelClearElement];
        
        
        [levelsElement addChild:levelElement];
    }
    
    // 写入文件
    GDataXMLDocument *document = [[[GDataXMLDocument alloc]
                                   initWithRootElement:levelsElement] autorelease];
    
    NSData *xmlData = document.XMLData;
    
    
    NSString *filePath = [self dataFilePath:TRUE forChapter:chapter];
    NSLog(@"Saving data to %@...", filePath);
    [xmlData writeToFile:filePath atomically:YES];
}

@end

