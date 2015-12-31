

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
#import "SGFocusImageFrame.h"
#import "SGFocusImageItem.h"

@class CustomTableView;
@protocol CustomTableViewDelegate <NSObject>
@required;
-(float)heightForRowAthIndexPath:(UITableView *)aTableView IndexPath:(NSIndexPath *)aIndexPath FromView:(CustomTableView *)aView;
-(void)didSelectedRowAthIndexPath:(UITableView *)aTableView IndexPath:(NSIndexPath *)aIndexPath FromView:(CustomTableView *)aView;
-(void)loadData:(void(^)(int aAddedRowCount))complete FromView:(CustomTableView *)aView;
-(void)refreshData:(void(^)())complete FromView:(CustomTableView *)aView;
@optional
//- (void)tableViewWillBeginDragging:(UIScrollView *)scrollView;
//- (void)tableViewDidScroll:(UIScrollView *)scrollView;
////- (void)tableViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
//- (BOOL)tableViewEgoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view FromView:(CustomTableView *)aView;
@end

@protocol CustomTableViewDataSource <NSObject>
@required;
-(NSInteger)numberOfRowsInTableView:(UITableView *)aTableView InSection:(NSInteger)section FromView:(CustomTableView *)aView;
-(UITableViewCell *)cellForRowInTableView:(UITableView *)aTableView IndexPath:(NSIndexPath *)aIndexPath FromView:(CustomTableView *)aView;

@end

@interface CustomTableView : UIView<UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate,SGFocusImageFrameDelegate>
{
    EGORefreshTableHeaderView *_refreshHeaderView;
    NSInteger     mRowCount;
}
//  Reloading var should really be your tableviews datasource
//  Putting it here for demo purposes
@property (nonatomic,assign) BOOL reloading;

@property (nonatomic,retain) UITableView *homeTableView;
@property (nonatomic,retain) NSMutableArray *tableInfoArray;
@property (nonatomic,assign) id<CustomTableViewDataSource> dataSource;
@property (nonatomic,assign) id<CustomTableViewDelegate>  delegate;

- (void)reloadTableViewDataSource;
#pragma mark 强制列表刷新
-(void)forceToFreshData;

@end
