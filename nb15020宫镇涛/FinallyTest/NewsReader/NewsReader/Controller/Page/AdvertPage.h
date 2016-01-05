

#import "FxBasePage.h"

@interface AdvertPage : FxBasePage{
    IBOutlet UIImageView    *_imageView;
}

+ (BOOL)canShowAdvertPage;
+ (void)showAdvertPage;

@end
