//
//  YCCommentViewController.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/14.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCCommentViewController.h"
#import "YCTableViewCommentCell.h"
#import "YCPost.h"
#import "AFNetworkTool.h"
#import "YCCommentFrame.h"
#import "YCComment.h"
#import "AppDelegate.h"
#import "YCPermission.h"
#import "YCAPIManager.h"

@interface YCCommentViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textViewComment;
@property (weak, nonatomic) IBOutlet UITextView *textViewPostContent;
@property (weak, nonatomic) IBOutlet UITableView *tableViewComment;
- (IBAction)btnComment:(id)sender;
- (IBAction)btnPrevComment:(id)sender;
- (IBAction)btnNextComment:(id)sender;

@property (nonatomic,strong) NSArray *commentFrame;
@property (nonatomic,copy) NSString *postURL;
@property (nonatomic,copy) NSString *post_id;
@property (nonatomic,copy) NSString *commentURL;

//保存当前页面状态信息（第几页、上下页是否存在(有则返回地址，没有返回空)、一共有多少条post这些信息）
@property (nonatomic,assign) int pageCount;
@property (nonatomic,assign) int pageNow;
@property (nonatomic,copy) NSString *prev;
@property (nonatomic,copy) NSString *next;
@end

@implementation YCCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarItem.title = @"评论";
    //设置一个导航栏，回到上一个页面
    UINavigationBar *navigationBar = [[UINavigationBar alloc] init];
    navigationBar.frame = CGRectMake(0, 0, 375, 50);
    UINavigationItem *navigationItem = [[UINavigationItem alloc] init];
    navigationItem.title = @"评论页";
    navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backToPrev)];
    [navigationBar pushNavigationItem:navigationItem animated:NO];
    [self.view addSubview:navigationBar];
    //注册一个通知。点击每一个微博下面的评论按钮之后就将这条微博url传递过来
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(showComment:) name:@"postWithComment" object:nil];
    
    //设置各个页面的属性
    self.textViewPostContent.layer.borderColor = [[UIColor blackColor] CGColor];
    self.textViewPostContent.layer.borderWidth = 1;
    self.textViewPostContent.layer.cornerRadius = 5;
    self.textViewComment.layer.borderColor = [[UIColor blackColor] CGColor];
    self.textViewComment.layer.borderWidth = 1;
    self.textViewComment.layer.cornerRadius = 5;
    //绑定
    self.tableViewComment.delegate = self;
    self.tableViewComment.dataSource = self;
}

//收到通知之后执行的方法
- (void)showComment:(NSNotification *)notification
{
    self.postURL = notification.userInfo[@"url"];
    self.commentURL = notification.userInfo[@"comment_url"];
    self.post_id = notification.userInfo[@"post_id"];
    NSLog(@"comment url %@",self.commentURL);
    //读取url数据
    [AFNetworkTool JSONDataWithUrl:self.postURL success:^(id dict) {
        //NSLog(@"%@", dict);
        //设置postContent内容
        self.textViewPostContent.text = dict[@"body"];
    } fail:^{
    }];
    [self loadComments:self.commentURL];
}

- (void)loadComments:(NSString *)url
{
    //获取评论数据
    [AFNetworkTool JSONDataWithUrl:url success:^(id dict) {
        //评论 arrComment数组转对象
        NSLog(@"%@",dict);
        self.prev = dict[@"prev"];
        self.next = dict[@"next"];
        self.pageNow = [dict[@"page"] intValue];
        self.pageCount = [dict[@"pageCount"] intValue];
        NSArray *arrComment = (NSArray *)dict[@"comments"];
        NSMutableArray *arrM = [NSMutableArray array];
        [arrComment enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //code
            YCComment *comment = [YCComment commentWithDict:obj];
            YCCommentFrame *commentFrame = [[YCCommentFrame alloc] init];
            commentFrame.comment = comment;
            [arrM addObject:commentFrame];
        }];
        _commentFrame = arrM;
        //重新加载数据
        [self.tableViewComment reloadData];
        if (_commentFrame.count !=0 ) {
            [self scrollToHeadAfterLoad];
        }
    } fail:^{
        //code
        NSLog(@"读取失败");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backToPrev
{
    //返回上一层页面
    [self dismissViewControllerAnimated:YES completion:^{
        //code
    }];
}

//这里的评论类似于“发送新的post”，需要账户信息
- (IBAction)btnComment:(id)sender {
    //如果有发表文章的权限
    if (([[AppDelegate APP].user can:[YCPermission COMMENT]]))
    {
        if ([[self.textViewComment.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
            [self showMsg:@"评论内容不能为空"];
            return;
        }
        NSDictionary *paramDict = @{@"body": self.textViewComment.text};
        [[YCAPIManager sharedManager] setUsername:[AppDelegate APP].user.email_or_token andPassword:[AppDelegate APP].user.password];
        //[[YCAPIManager sharedManager] setToken:@"eyJhbGciOiJIUzI1NiIsImV4cCI6MTQ1MDA3ODcxMiwiaWF0IjoxNDUwMDc1MTEyfQ.eyJpZCI6Mjd9.DbeQawXU_UcnVnycne4JAN1Ao9XHkJuDFjo06zxdKNk"];
        //@"/api/v1.0/posts/<int:id>/comments/"
        [[YCAPIManager sharedManager] POST:[NSString stringWithFormat:@"/api/v1.0/posts/%d/comments/", [self.post_id intValue]] parameters:paramDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self showMsg:@"评论已发送"];
            //刷新评论区内容
            [self loadComments:self.commentURL];
            //发送成功之后，使用通知刷新一下首页内容 成功yes
            //通知中心是桥梁，既可以post发送消息，也可以addObserver接收消息
            NSNotification *notification = [NSNotification notificationWithName:@"returnToIndex" object:nil];
            [[NSNotificationCenter defaultCenter] postNotification:notification];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            // error stuff here
            [self showMsg:@"评论失败"];
        }];
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"非登录用户" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            //失败处理
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:^{
            //
        }];
    }
}

//上一页
- (IBAction)btnPrevComment:(id)sender {
    if (![self.prev isEqual:[NSNull null]] && self.prev != NULL) {
        NSString *url = self.prev;
        [self loadComments:url];
        //显示第一条信息
        [self scrollToHeadAfterLoad];
    }else{
        [self showMsg:@"已经是首页了!"];
    }

}

//下一页
- (IBAction)btnNextComment:(id)sender {
    if (![self.next isEqual:[NSNull null]] && self.next != NULL) {
        NSString *url = self.next;
        [self loadComments:url];
        //显示第一条信息
        [self scrollToHeadAfterLoad];
    }else{
        [self showMsg:@"已经是末页了!"];
    }
}

//如果没有“上一页”或“没有下一页”了，显示一个提示没有上（下）一页的动画
- (void)showMsg:(NSString *)text
{
    UILabel *lblFailMsg = [[UILabel alloc] init];
    lblFailMsg.text = text;
    lblFailMsg.alpha = 1.0;
    lblFailMsg.textColor = [UIColor whiteColor];
    lblFailMsg.font = [UIFont systemFontOfSize:14];
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

//为了每次点击上一页、下一页之后自动跳转到第一条信息，执行这个方法
- (void)scrollToHeadAfterLoad
{
    //加载之后显示每页第一条信息
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableViewComment scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

#pragma mark --绑定数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.commentFrame.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YCCommentFrame *commentFrame = self.commentFrame[indexPath.row];
    YCTableViewCommentCell *cell = [YCTableViewCommentCell tableViewCommentCellWithTableView:self.tableViewComment];
    cell.commentFrame = commentFrame;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    YCCommentFrame *commentFrame = self.commentFrame[indexPath.row];
    return commentFrame.rowHeight;
}

//隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return true;
}
@end
