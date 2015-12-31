
#import <UIKit/UIKit.h>
#import "MenuHrizontal.h"
#import "ScrollPageView.h"

@interface HomeView : UIView<MenuHrizontalDelegate,ScrollPageViewDelegate>
{
    MenuHrizontal *mMenuHriZontal;
    ScrollPageView *mScrollPageView;
}


@end
