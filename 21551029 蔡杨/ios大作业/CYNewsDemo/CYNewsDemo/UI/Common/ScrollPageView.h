

#import <UIKit/UIKit.h>
#import "CustomTableView.h"

@protocol ScrollPageViewDelegate <NSObject>
-(void)didScrollPageViewChangedPage:(NSInteger)aPage;
@end

@interface ScrollPageView : UIView<UIScrollViewDelegate,CustomTableViewDataSource,CustomTableViewDelegate>
{
    NSInteger mCurrentPage;
    BOOL mNeedUseDelegate;
}
@property (nonatomic,retain) UIScrollView *scrollView;

@property (nonatomic,retain) NSMutableArray *contentItems;

@property (nonatomic,assign) id<ScrollPageViewDelegate> delegate;

#pragma mark 添加ScrollowViewd的ContentView
-(void)setContentOfTables:(NSInteger)aNumerOfTables;
#pragma mark 滑动到某个页面
-(void)moveScrollowViewAthIndex:(NSInteger)aIndex;
#pragma mark 刷新某个页面
-(void)freshContentTableAtIndex:(NSInteger)aIndex;
#pragma mark 改变TableView上面滚动栏的内容
-(void)changeHeaderContentWithCustomTable:(CustomTableView *)aTableContent;
@end
