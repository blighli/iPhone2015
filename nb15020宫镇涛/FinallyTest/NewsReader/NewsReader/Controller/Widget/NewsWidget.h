

#import "FxTableWidget.h"
#import "ColumnInfo.h"

@interface NewsWidget : FxTableWidget {
    BOOL        _hasNextPage;
    NSInteger   _pageIndex;
}

@property(nonatomic, strong) ColumnInfo   *columnInfo;

@end
