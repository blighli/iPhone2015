//
//  ChapterParser.m
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//
//

#import "ChapterParser.h"
#import "Chapter.h"
#import "Chapters.h"
#import "GDataXMLNode.h"

@implementation ChapterParser

+ (NSString *)dataFilePath:(BOOL)forSave {
    
    NSString *xmlFileName = @"Chapters";
    
    
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

+ (Chapters *)loadData {
    
    NSString *name;
    int number;
    BOOL unlocked;
    
    
    Chapters *chapters = [[[Chapters alloc] init] autorelease];
    
    
    NSString *filePath = [self dataFilePath:FALSE];
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
    if (doc == nil) { return nil; NSLog(@"xml file is empty!");}
    NSLog(@"Loading %@", filePath);
    
    
    
    NSArray *dataArray = [doc nodesForXPath:@"//Chapters/Chapter" error:nil];
    NSLog(@"Array Contents = %@", dataArray);
    
   
    
    for (GDataXMLElement *element in dataArray) {
        
        NSArray *nameArray = [element elementsForName:@"Name"];
        NSArray *numberArray = [element elementsForName:@"Number"];
        NSArray *unlockedArray = [element elementsForName:@"Unlocked"];
        
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
        
        
        Chapter *chapter = [[Chapter alloc] initWithName:name number:number unlocked:unlocked];
        [chapters.chapters addObject:chapter];
    }
    
    [doc release];
    [xmlData release];
    return chapters;
}

@end