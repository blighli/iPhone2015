

#import <Foundation/Foundation.h>
#import "NewsInfo.h"

@interface FxDownload : NSObject

@property(nonatomic, strong)NSMutableDictionary *dictIcons;

+ (FxDownload *)download;

- (void)cancelDownload;
- (void)setNewsIcon:(NewsInfo *)newsInfo
          imageView:(UIImageView *)imageView;

@end
