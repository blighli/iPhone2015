

#import <UIKit/UIKit.h>

@interface FxButtonHelper : NSObject

@property(nonatomic, strong) UIButton   *button;
@property(nonatomic, strong) UIColor    *normalColor;
@property(nonatomic, strong) UIColor    *selectedColor;

- (void)setButton:(UIButton *)btn
      normalColor:(UIColor *)nColor
    selectedColor:(UIColor *)sColor;

- (void)setSelected:(BOOL)selected;

@end
