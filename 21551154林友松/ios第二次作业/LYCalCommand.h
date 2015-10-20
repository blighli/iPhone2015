#import <Foundation/Foundation.h>

@interface LYCalCommand : NSObject

@property (nonatomic,assign) int month;
@property (nonatomic,assign) int year;

+ (void) printNoSuchCommand;
- (void) printMonth;
- (void) printYear;
@end