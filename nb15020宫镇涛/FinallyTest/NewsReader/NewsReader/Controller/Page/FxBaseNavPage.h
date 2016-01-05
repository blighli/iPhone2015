

#import "FxBaseController.h"

@interface FxBaseNavPage : FxBaseController

@property(nonatomic, strong) NSString   *barBackgroudImage;

- (void)setNavigationItem:(NSString *)title
                 selector:(SEL)selector
                  isRight:(BOOL)isRight;

@end
