//
//  ZMHHomeViewController.m
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/26.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//
#import "ZMHHomeViewController.h"

#import "UIBarButton+Item.h"
#import "ZMHTitleButton.h"

#import "ZMHPopMenu.h"
#import "ZMHCover.h"
#import "ZMHOneViewController.h"


#import "ZMHStatus.h"
#import "ZMHUser.h"


#import "MJExtension.h"
#import "UIImageView+WebCache.h"

#import "MJRefresh.h"


#import "ZMHStatusTool.h"
#import "ZMHUserTool.h"
#import "ZMHAccountTool.h"
#import "ZMHAccount.h"

#import "ZMHStatusCell.h"

#import "ZMHStatusFrame.h"
@interface ZMHHomeViewController ()<ZMHCoverDelegate>

@property (nonatomic, weak) ZMHTitleButton *titleButton;

@property (nonatomic, strong) ZMHOneViewController *one;

/**
 *  ViewModel:ZMHStatusFrame
 */
@property (nonatomic, strong) NSMutableArray *statusFrames;

@end

@implementation ZMHHomeViewController




- (NSMutableArray *)statusFrames
{
    if (_statusFrames == nil) {
        _statusFrames = [NSMutableArray array];
    }
    return _statusFrames;
}

- (ZMHOneViewController *)one
{
    if (_one == nil) {
        _one = [[ZMHOneViewController alloc] init];
    }
    
    return _one;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    
    // 取消分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 设置导航条内容
    [self setUpNavgationBar];
    // 添加下拉刷新控件
    [self.tableView addHeaderWithTarget:self action:@selector(loadNewStatus)];
    
    // 自动下拉刷新
    [self.tableView headerBeginRefreshing];
    
    // 添加上拉刷新控件
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreStatus)];
    
    
    // 一开始展示之前的微博名称，然后在发送用户信息请求，直接赋值
    
    // 请求当前用户的昵称
    [ZMHUserTool userInfoWithSuccess:^(ZMHUser *user) {
        
        // 请求当前账号的用户信息
        // 设置导航条的标题
        [self.titleButton setTitle:user.name forState:UIControlStateNormal];
        // 获取当前的账号
        ZMHAccount *account = [ZMHAccountTool account];
    
        account.name = user.name;
        
        // 保存用户的名称
        [ZMHAccountTool saveAccount:account];
        
        
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - 刷新最新的微博
- (void)refresh{
    
    // 自动下拉刷新
    [self.tableView headerBeginRefreshing];
    
}

//  {:json字典 [:json数组

#pragma mark - 请求更多旧的微博
- (void)loadMoreStatus
{
    NSString *maxIdStr = nil;
    if (self.statusFrames.count) { // 有微博数据，才需要下拉刷新
        ZMHStatusFrame *frame  = [self.statusFrames lastObject];
        ZMHStatus *s = frame.status ;
        long long maxId = [s.idstr longLongValue] - 1;
        maxIdStr = [NSString stringWithFormat:@"%lld",maxId];
    }
    
    // 请求更多的微博数据
    [ZMHStatusTool moreStatusWithMaxId:maxIdStr success:^(NSArray *statuses) {
        
        // 结束上拉刷新
        [self.tableView footerEndRefreshing];
        
        // 模型转换视图模型 ZMHStatus -> ZMHStatusFrame
        NSMutableArray *statusFrames = [NSMutableArray array];
        for (ZMHStatus *status in statuses) {
            ZMHStatusFrame *statusF = [[ZMHStatusFrame alloc] init];
            statusF.status = status;
            [statusFrames addObject:statusF];
        }
        
        // 把数组中的元素添加进去
        [self.statusFrames addObjectsFromArray:statusFrames];
        
        // 刷新表格
        [self.tableView reloadData];
        
        
    } failure:^(NSError *error) {
        
    }];
    
}




#pragma mark - 请求最新的微博
- (void)loadNewStatus
{
    NSString *sinceId = nil;
    if (self.statusFrames.count) { // 有微博数据，才需要下拉刷新
        ZMHStatusFrame *frame = [self.statusFrames lastObject] ;
        ZMHStatus *s = frame.status ;
        sinceId = s.idstr;
    }
    
    [ZMHStatusTool newStatusWithSinceId:sinceId success:^(NSArray *statuses) { // 请求成功的Block
        
        // 展示最新的微博数
        [self showNewStatusCount:statuses.count];
        
        // 结束下拉刷新
        [self.tableView headerEndRefreshing];
        
        // 模型转换视图模型 ZMHStatus -> ZMHStatusFrame
        NSMutableArray *statusFrames = [NSMutableArray array];
        for (ZMHStatus *status in statuses) {
            ZMHStatusFrame *statusF = [[ZMHStatusFrame alloc] init];
            statusF.status = status;
            [statusFrames addObject:statusF];
        }
        
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statuses.count)];
        // 把最新的微博数插入到最前面
        [self.statusFrames insertObjects:statusFrames atIndexes:indexSet];
        
        // 刷新表格
        [self.tableView reloadData];
        
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error) ;
        
    }];
    
}
#pragma mark - 展示最新的微博数
-(void)showNewStatusCount:(int)count
{
    if (count == 0) return;
    
    // 展示最新的微博数
    CGFloat h = 35;
    CGFloat y = CGRectGetMaxY(self.navigationController.navigationBar.frame) - h;
    CGFloat x = 0;
    CGFloat w = self.view.width;
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
    
    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
    label.textColor = [UIColor whiteColor];
    label.text = [NSString stringWithFormat:@"最新微博数%d",count];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    // 插入导航控制器下导航条下面
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    
    // 动画往下面平移
    [UIView animateWithDuration:0.25 animations:^{
        label.transform = CGAffineTransformMakeTranslation(0, h);
        
    } completion:^(BOOL finished) {
        
        
        // 往上面平移
        [UIView animateWithDuration:0.25 delay:2 options:UIViewAnimationOptionCurveLinear animations:^{
            
            // 还原
            label.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
        
    }];
    
}

#pragma mark - 设置导航条
- (void)setUpNavgationBar
{
    // 左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] highImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] target:self action:@selector(friendsearch) forControlEvents:UIControlEventTouchUpInside];
    
    // 右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_pop"] highImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] target:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    
    // titleView
    ZMHTitleButton *titleButton = [ZMHTitleButton buttonWithType:UIButtonTypeCustom];
    _titleButton = titleButton;
    //    NSLog(@"%@",[ZMHAccountTool account].name);
    NSString *title = [ZMHAccountTool account].name?[ZMHAccountTool account].name:@"首页";
    [titleButton setTitle:title forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateSelected];
    
    // 高亮的时候不需要调整图片
    titleButton.adjustsImageWhenHighlighted = NO;
    
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = titleButton;
}
// 以后只要显示在最前面的控件，一般都加在主窗口
// 点击标题按钮
- (void)titleClick:(UIButton *)button
{
    button.selected = !button.selected;
    
    // 弹出蒙板
    ZMHCover *cover = [ZMHCover show];
    cover.delegate = self;
    
    
    // 弹出pop菜单
    CGFloat popW = 200;
    CGFloat popX = (self.view.width - 200) * 0.5;
    CGFloat popH = popW;
    CGFloat popY = 55;
    ZMHPopMenu *menu = [ZMHPopMenu showInRect:CGRectMake(popX, popY, popW, popH)];
    menu.contentView = self.one.view;
    
    
}

// 点击蒙板的时候调用
- (void)coverDidClickCover:(ZMHCover *)cover
{
    // 隐藏pop菜单
    [ZMHPopMenu hide];
    
    _titleButton.selected = NO;
    
}

- (void)friendsearch
{
    
}

- (void)pop
{
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.statusFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 创建cell
    ZMHStatusCell *cell = [ZMHStatusCell cellWithTableView:tableView];
    
    
    // 获取status模型
    ZMHStatusFrame *statusF = self.statusFrames[indexPath.row];
    
    // 给cell传递模型
    cell.statusF = statusF;
    //    // 用户昵称
    //    cell.textLabel.text = status.user.name;
    //    [cell.imageView sd_setImageWithURL:status.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    //    cell.detailTextLabel.text = status.text;
    
    return cell;
}

// 返回cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取status模型
    ZMHStatusFrame *statusF = self.statusFrames[indexPath.row];
    
    return statusF.cellHeight;
}


@end
