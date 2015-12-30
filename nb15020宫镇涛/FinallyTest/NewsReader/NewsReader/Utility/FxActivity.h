
#import <UIKit/UIKit.h>

@interface FxActivity : UIView

@property (copy) NSString *labelText;
@property (copy) NSString *detailsLabelText;

- (id)initWithView:(UIView *)view;
- (void)show:(BOOL)animated;
- (void)hide:(BOOL)animated;
- (void)hide:(BOOL)animated afterDelay:(NSTimeInterval)delay;

@end
