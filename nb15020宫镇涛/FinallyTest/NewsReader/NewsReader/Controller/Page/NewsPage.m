

#import "NewsPage.h"
#import "NewsLandscapeCell.h"
#import "ColumnInfo.h"
#import "WeatherPage.h"
#import "FxPush.h"

@implementation NewsPage

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavigationLeft:@"NavigationBell.png" sel:nil];
    [self setNavigationRight:@"NavigationSquare.png"];
    [self setNavigationTitleImage:@"NavBarIcon.png"];
 
    _tableView.gapBetweenCells = 2;
    _tableView.cellsToPreload = 1;
    _tableView.currentCellIndex = -1;
    
    [[FxGlobal global].push setAlias:@"123"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (_barWidget == nil) {
        [self addBarWidget];
    }
}

- (void)addBarWidget
{
    _barWidget = [[ColumnBarWidget alloc] init];
    
    _barWidget.delegate = self;
    _barWidget.view.frame = _barBackView.bounds;
    [_barBackView addSubview:_barWidget.view];
    
    [_barBackView sendSubviewToBack:_barWidget.view];
}

- (void)didSelect:(NSInteger)pageIndex
{
    if (_tableView.currentCellIndex != pageIndex) {
        _tableView.currentCellIndex = pageIndex;
        [_tableView reloadData];
    }
}

- (IBAction)doRight:(id)sender
{
    WeatherPage *page = [[WeatherPage alloc] init];
    
    page.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:page animated:YES];
}


#pragma mark - FxLandscapeViewDataSource & FxLandscapeViewDelegate methods

- (NSInteger)numberOfCellsInTableView:(FxLandscapeTableView *)tableView
{
    return _barWidget.listData.count;
}

- (FxLandscapeCell *)cellInTableView:(FxLandscapeTableView *)tableView atIndex:(NSInteger)index
{
    NewsLandscapeCell *cell = (NewsLandscapeCell *)[tableView dequeueReusableCell];
    
    if (cell == nil) {
        cell = [[NewsLandscapeCell alloc] initWithFrame:_tableView.bounds];
        cell.owner = self;
    }
    
    ColumnInfo *info = [_barWidget.listData objectAtIndex:index];
    [cell setCellData:info];
    
    return cell;
}

- (void)tableView:(FxLandscapeTableView *)tableView didChangeAtIndex:(NSInteger)index
{
    _barWidget.pageIndex = index;
}

@end
