

#import "FxBaseNavPage.h"
#import "ColumnBarWidget.h"
#import "FxLandscapeTableView.h"

@interface NewsPage : FxBaseNavPage <ColumnBarDelegate> {
    IBOutlet UIView                 *_barBackView;
    IBOutlet FxLandscapeTableView   *_tableView;
    ColumnBarWidget                 *_barWidget;
}

@end
