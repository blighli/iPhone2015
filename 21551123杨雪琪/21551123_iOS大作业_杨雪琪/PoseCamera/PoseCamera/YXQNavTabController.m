//
//  YXQNavTabController.m
//  PoseCamera
//
//  Created by YXQ on 15/12/21.
//  Copyright © 2015年 YXQ. All rights reserved.
//

#import "YXQNavTabController.h"
#import "YXQNavTabBar.h"
#import "YXQConstant.h"

@interface YXQNavTabController()<UIScrollViewDelegate, YXQNavTabBarDelegate>

@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) UIScrollView *mainView;
@property (nonatomic, strong) YXQNavTabBar *navTabBar;
@property (nonatomic, assign) NSInteger currentIndex;
//@property (nonatomic, assign) NSInteger headLastFlag;

@end

@implementation YXQNavTabController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self viewInit];
    [self initConfig];
}

- (void)viewInit
{
    _navTabBarColor = _navTabBarColor ? _navTabBarColor : bgColor;
    
    UIView *statusView = [[UIView alloc] initWithFrame:CGRectMake(ZERO_COORDINATE, ZERO_COORDINATE, SCREEN_WIDTH, STATUS_BAR_HEIGHT)];
    statusView.backgroundColor = bgColor;
    [self.view addSubview:statusView];
    
    _navTabBar = [[YXQNavTabBar alloc] initWithFrame:CGRectMake(ZERO_COORDINATE, STATUS_BAR_HEIGHT, SCREEN_WIDTH, NAV_TAB_BAR_HEIGHT)];
    _navTabBar.delegate = self;
    _navTabBar.backgroundColor = _navTabBarColor;
    
    _mainView = [[UIScrollView alloc] initWithFrame:CGRectMake(ZERO_COORDINATE, _navTabBar.frame.origin.y + _navTabBar.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - _navTabBar.frame.origin.y - _navTabBar.frame.size.height)];
    _mainView.delegate = self;
    _mainView.pagingEnabled = YES;
    _mainView.bounces = _mainViewBounces;
    _mainView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:_mainView];
    [self.view addSubview:_navTabBar];
}

- (void)initConfig
{
    if ([NSUD objectForKey:SELECTED_CHANNEL_NAMES] == nil) {
        for (int index = 0; index < _selectedToIndex; index++) {
            UIViewController *viewController = (UIViewController *)_subViewControllers[index];
            viewController.view.frame = CGRectMake(index * SCREEN_WIDTH, ZERO_COORDINATE, SCREEN_WIDTH, _mainView.frame.size.height);
            [_mainView addSubview:viewController.view];
            [self addChildViewController:viewController];
            [self.titles addObject:[_subViewControllers[index] title]];
        }
        _mainView.contentSize = CGSizeMake(SCREEN_WIDTH * _selectedToIndex, ZERO_COORDINATE);
    }else{
        self.titles = [NSUD objectForKey:SELECTED_CHANNEL_NAMES];
    }
    _navTabBar.selectedItemTitles = _titles;
}

- (void)addParentController:(UIViewController *)viewController
{
    if ([viewController respondsToSelector:@selector(edgesForExtendedLayout)]) {
        viewController.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [viewController addChildViewController:self];
    [viewController.view addSubview:self.view];
}

//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
//{
//    CGPoint velocity = [scrollView.panGestureRecognizer velocityInView:scrollView.superview];
//    if (scrollView.contentOffset.x == 0 && velocity.x >0) {
//        //向右滑动
//        NSLog(@"第一个向右滑动");
//        [self itemDidSelectedWithIndex:TABITEMSNUM - 1];
//        _headLastFlag = 111;
//    } else if(scrollView.contentOffset.x == SCREEN_WIDTH * (TABITEMSNUM - 1) && velocity.x < 0){
//        //向左滑动
//        NSLog(@"最后一个向左滑动");
//       [self itemDidSelectedWithIndex:0];
//        _headLastFlag = 222;
//    }else{
//        _headLastFlag = 333;
//    }
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _currentIndex = round(scrollView.contentOffset.x / SCREEN_WIDTH);
    _navTabBar.currentIndex = _currentIndex;
//    if (_headLastFlag == 111) {
//        _currentIndex = TABITEMSNUM - 1;
//        _navTabBar.currentIndex = _currentIndex;
//    }else if(_headLastFlag == 222){
//        _currentIndex = 0;
//        _navTabBar.currentIndex = _currentIndex;
//    }else{
//        _currentIndex = round(scrollView.contentOffset.x / SCREEN_WIDTH);
//        _navTabBar.currentIndex = _currentIndex;
//    }
}

- (void)itemDidSelectedWithIndex:(NSInteger)index
{
    [_mainView setContentOffset:CGPointMake(index * SCREEN_WIDTH, ZERO_COORDINATE) animated:_scrollAnimation];
}

- (NSMutableArray *)titles
{
    if (_titles == nil) {
        _titles = [@[] mutableCopy];
    }
    return _titles;
}
@end
