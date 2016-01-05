//
//  YCIndexViewController.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/11.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCIndexViewController.h"
#import "AFNetworkTool.h"
#import "YCPost.h"
#import "YCPostFrame.h"
#import "YCTableViewCell.h"
#import "YCTableViewFooterView.h"
#import "YCTableViewHeaderView.h"
#import "YCCommentViewController.h"
#define tabBarItemFont [UIFont systemFontOfSize:18]

@interface YCIndexViewController ()<UITableViewDelegate, UITableViewDataSource, YCTableViewFooterViewDelegate, YCTableViewHeaderViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *postsFrame;
//保存当前页面状态信息（第几页、上下页是否存在(有则返回地址，没有返回空)、一共有多少条post这些信息）
@property (nonatomic,assign) int pageCount;
@property (nonatomic,assign) int pageNow;
@property (nonatomic,copy) NSString *prev;
@property (nonatomic,copy) NSString *next;
@end

@implementation YCIndexViewController

- (void)LoadpostsFrame:(NSString *)url
{
    [AFNetworkTool JSONDataWithUrl:url success:^(id dict) {
        self.prev = dict[@"prev"];
        self.next = dict[@"next"];
        self.pageCount = [dict[@"count"] intValue];
        self.pageNow = [dict[@"page"] intValue];
        //NSLog(@"%@\n%@\n%d\n", self.prev, self.next, self.pageCount);
        //类似于懒加载
        NSArray *arr = (NSArray *)dict[@"posts"];
        NSMutableArray *arrM = [NSMutableArray array];
        [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            YCPost *post = [YCPost PostWithDict:obj];
            YCPostFrame *postFrame = [[YCPostFrame alloc] init];
            postFrame.Post = post;
            [arrM addObject:postFrame];
        }];
        _postsFrame = arrM;
        //异步获取完数据之后，重新加载以显示数据
        [self.tableView reloadData];
        
        //设想：显示页面的时候，不显示出“点击加载上一页”这些按钮
        [self scrollToHeadAfterLoad];
    } fail:^{
        NSLog(@"请求失败");
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [AFNetworkTool netWorkStatus];//输入网络连接方式1、2、3、4
    NSString *url = @"http://121.42.172.76/api/v1.0/posts/";
    [self LoadpostsFrame:url];
    
    //把当前控制器加入到根视图中
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"主页";
    NSDictionary *attr = @{NSFontAttributeName: tabBarItemFont};
    [self.tabBarItem setTitleTextAttributes:attr forState:UIControlStateNormal];
    self.tabBarItem.title = @"主页";
    //[self addNavigationBar];
    
    //设置当前控制器中的tableView
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 50);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //设置footerView以及设置当前控制器为代理对象
    YCTableViewFooterView *tableViewFooterView = [YCTableViewFooterView tableViewFooterView];
    tableViewFooterView.delegate = self;
    self.tableView.tableFooterView = tableViewFooterView;
    //设置headerView以及设置当前控制器为代理对象
    YCTableViewHeaderView *tableViewHeaderView = [YCTableViewHeaderView tableViewHeaderView];
    tableViewHeaderView.delegate = self;
    self.tableView.tableHeaderView = tableViewHeaderView;
    [self.view addSubview:self.tableView];
    //添加一个通知---通知的一点点说明：一个应用程序有一个通知中心单例，在接收的地方添加观察者，在发送的地方post
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];//单例对象
    [center addObserver:self selector:@selector(returnToIndex) name:@"returnToIndex" object:nil];
    //再添加一个通知
    [center addObserver:self selector:@selector(showCommentPage:) name:@"showComment" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --实现通知方法
- (void)returnToIndex
{
    NSString *url = @"http://121.42.172.76/api/v1.0/posts/";
    [self LoadpostsFrame:url];
    //显示第一条信息
    [self scrollToHeadAfterLoad];
}

- (void)showCommentPage:(NSNotification *)notification
{
    YCCommentViewController *commentViewController = [[YCCommentViewController alloc] init];
    [self presentViewController:commentViewController animated:YES completion:^{
        //code
    }];
    //再次发送一个通知到Comment页面，将userInfo中的url传递过去
    NSNotification *newNotification = [[NSNotification alloc] initWithName:@"postWithComment" object:nil userInfo:notification.userInfo];
    [[NSNotificationCenter defaultCenter] postNotification:newNotification];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.postsFrame.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1.获取模型
    YCPostFrame *model = self.postsFrame[indexPath.row];
    //2.创建cell
    YCTableViewCell *cell = [YCTableViewCell tableViewCellWithTableView:tableView];
    //3.加载数据
    cell.postFrame = model;
    //4.返回
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YCPostFrame *postFrame = self.postsFrame[indexPath.row];
    return postFrame.rowHeight;
}

#pragma mark --代理方法
//改进，只有下拉到达到一定偏移量才开始刷新
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //下拉 偏移量为负
    if (self.tableView.contentOffset.y < -80) {
        //实现tableView的scrollViewDidEndDragging代理方法，执行重新查询重新加载页面的方法
        NSString *url = [NSString stringWithFormat:@"http://121.42.172.76/api/v1.0/posts/?page=%d", self.pageNow];
        [self LoadpostsFrame:url];
        [self.tableView reloadData];
    }
}

#pragma mark --实现footer中的协议
- (void)postNextPage
{
    if (![self.next isEqual:[NSNull null]] && self.next != NULL) {
        NSString *url = self.next;
        [self LoadpostsFrame:url];
        //显示第一条信息
        [self scrollToHeadAfterLoad];
    }else{
        [self showMsg:@"已经是末页了!"];
    }
}

#pragma mark --实现header中的协议
- (void)postPrevPage
{
    if ((![self.prev isEqual:[NSNull null]]) && self.prev != NULL) {
        NSString *url = self.prev;
        [self LoadpostsFrame:url];
        //显示第一条信息
        [self scrollToHeadAfterLoad];
    }else{
        [self showMsg:@"已经是首页了!"];
    }
}

//为了每次点击上一页、下一页之后自动跳转到第一条信息，执行这个方法
- (void)scrollToHeadAfterLoad
{
    //加载之后显示每页第一条信息
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

//如果没有“上一页”或“没有下一页”了，显示一个提示没有上（下）一页的动画
- (void)showMsg:(NSString *)text
{
    UILabel *lblFailMsg = [[UILabel alloc] init];
    lblFailMsg.text = text;
    lblFailMsg.alpha = 1.0;
    lblFailMsg.textColor = [UIColor whiteColor];
    [lblFailMsg setTextAlignment:NSTextAlignmentCenter];
    lblFailMsg.backgroundColor = [UIColor grayColor];
    lblFailMsg.layer.masksToBounds = YES;
    lblFailMsg.layer.cornerRadius = 5;
    lblFailMsg.frame = CGRectMake(125, 250, 125, 50);
    [self.view addSubview:lblFailMsg];
    [UIView animateWithDuration:2.5 animations:^{
        //code
        lblFailMsg.alpha = 0;
    } completion:^(BOOL finished) {
        //code
    }];
}

//不显示手机状态栏
- (BOOL)prefersStatusBarHidden
{
    return true;
}

@end
