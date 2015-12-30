
#import "FxBaseController.h"

@interface FxBaseWidget : FxBaseController

@property(strong, nonatomic) NSMutableArray    *listData;

- (void)updateUI;
- (void)reloadData;
- (BOOL)isReloadLocalData;

@end
