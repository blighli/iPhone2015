//
//  JYHomeTableViewController.m
//  顾金跃_微博
//
//  Created by 123 on 15/10/17.
//  Copyright © 2015年 GJY. All rights reserved.
//
/*
 1.OAuth认证:是一种协议,为用户资源的授权提供了一个安全的开放的简易的标准
 2.我们想访问用户的新郎微博数据,就必须通过新浪实现的OAuth认证
 3.第三方不会触及到账号和密码
 
 打开服务商提供的账号密码输入页面(比如新浪微博提供的)
 */

#import "JYHomeTableViewController.h"
//#import "JYBadgeButton.h"
#import "JYTitleButton.h"
#import "AFNetworking.h"
#import "JYAccount.h"
#import "UIImageView+WebCache.h"
#import "JYStatus.h"
#import "JYUser.h"
#import "JYStatusFrame.h"
#import "JYStatusCell.h"
@interface JYHomeTableViewController ()

@property(nonatomic,strong)NSArray *statusFrames;

@end

@implementation JYHomeTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //1.设置导航栏
    [self setupNavBar];
    
    //2.加载微博数据
    [self setupStatusData];
    
    self.tableView.rowHeight=160;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
   
}
-(void)setupStatusData
{
    //1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    //说明服务器返回的是json数据
    mgr.responseSerializer=[AFJSONResponseSerializer serializer];
    
    //2.封装请求参数
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    
    NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *file=[doc stringByAppendingPathComponent:@"account.data"];
    JYAccount *account=[NSKeyedUnarchiver unarchiveObjectWithFile:file];
    
    params[@"access_token"]=account.access_token;
    params[@"count"]=@20;
    
    
    //3.发送请求
    [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         //请求成功
         NSLog(@"请求成功%@",responseObject);
         
         //1.取出所有的微博数据(每一条微博都是一个字典)
         NSArray *dictArray=responseObject[@"statuses"];
         
         //将字典数据转换为模型数据
         NSMutableArray *statusFrameArray=[NSMutableArray array];
         for (NSDictionary *dict in dictArray)
         {
             //新建模型对象
             JYStatus *status=[JYStatus statusWithDict:dict];
                        
             //创建frame模型
             JYStatusFrame *statusFrame=[[JYStatusFrame alloc]init];
             statusFrame.status=status;
             
             //添加模型
             [statusFrameArray addObject:statusFrame];
         }
         self.statusFrames=statusFrameArray;
         
        //2.刷新表格
         [self.tableView reloadData];
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         //请求失败
         NSLog(@"请求失败%@",error);
    }];

}

-(void)setupNavBar
{
    //左边按钮
    
    self.navigationItem.leftBarButtonItem=[self itemWithIcon:@"navigationbar_friendsearch_os7" highIcon:@"navigationbar_friendsearch_highlighted_os7" action:@selector(find)];
    //右边按钮
    self.navigationItem.rightBarButtonItem=[self itemWithIcon:@"navigationbar_pop_os7" highIcon:@"navigationbar_pop_highlighted_os7" action:@selector(pop)];
    
    
    
    //中间按钮
    JYTitleButton *titleButton=[JYTitleButton titleButton];
    titleButton.tag=0;
    //图标
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    //文字
    [titleButton setTitle:@"顾金跃" forState:UIControlStateNormal];
    //尺寸
    titleButton.frame=CGRectMake(0, 0, 100, 40);
    [titleButton addTarget:self action:@selector(clickTitle:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView=titleButton;
    
    self.tableView.contentInset=UIEdgeInsetsMake(0, 0, 10, 0);
}
-(void)clickTitle:(JYTitleButton *)titleButton
{
    if(titleButton.tag==1)
    {
        [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        titleButton.tag=0;
    }
    else
    {
        [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
        titleButton.tag=1;
    }
    
}
//快速创建一个用来显示图片的item
-(UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon action:(SEL)action
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highIcon] forState:UIControlStateHighlighted];
    button.frame=CGRectMake(0, 0, button.currentBackgroundImage.size.width, button.currentBackgroundImage.size.height);
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:button];
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

-(void)find
{
    NSLog(@"左边按钮被点击了");
}
-(void)pop
{
    NSLog(@"右边按钮被点击了");
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}
-(JYStatusCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cellId";
    JYStatusCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell==nil)
    {
        cell=[[JYStatusCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    //传递模型
    cell.statusFrame=self.statusFrames[indexPath.row];

    return cell;
    
//    //微博的文字
//    JYStatus *status=self.statuses[indexPath.row];
//    cell.textLabel.text=status.text;
//    
//    //微博作者的昵称
//    JYUser *user=status.user;
//    cell.detailTextLabel.text=user.name;
//    
//    //微博作者的头像
//    //SDWebImage
//    //NSString *iconUrl=user[@"profile_image_url"];
////    NSData *imageData=[NSData dataWithContentsOfURL:[NSURL URLWithString:iconUrl]];
////    cell.imageView.image=[UIImage imageWithData:imageData];
//    [cell.imageView setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageNamed:@"game_center"]];
    //return cell;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JYStatusFrame *statusFrame=self.statusFrames[indexPath.row];
    return statusFrame.cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc=[[UIViewController alloc]init];
    vc.view.backgroundColor=[UIColor redColor];
//    //跳转的时候隐藏tabbar
//    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
