

#import "FxBaseWidget.h"

@interface FxTableWidget : FxBaseWidget {
    IBOutlet UITableView     *_tableView;
    CGFloat                 _cellHeight;
}

@property(nonatomic, strong) NSString   *cellIdentifier;
@property(nonatomic, assign) id         owner;

@end
