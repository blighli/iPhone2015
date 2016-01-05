//
//  changeCityViewController.m
//  美团
//
//  Created by 陈受恩 on 15/12/10.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "changeCityViewController.h"
#import "cityGroupModel.h"
#import "UIView+AutoLayout.h"
#import "SearchCityResultViewController.h"

@interface changeCityViewController ()<UITabBarControllerDelegate,UITableViewDataSource,UISearchBarDelegate>{
    NSArray *_dataArray;
}
@property (weak, nonatomic) IBOutlet UIView *coverView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) SearchCityResultViewController *searchResultVC;


@end

@implementation changeCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"切换城市";
    //关闭按钮
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_navigation_close" ]style:UIBarButtonItemStyleDone target:self action:@selector(backToVc)];
    self.navigationItem.leftBarButtonItem=item;
    //获取数据源
    cityGroupModel *md=[[cityGroupModel alloc]init];
    _dataArray=[md getModelArray];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)backToVc{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}
//每组的成员数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[_dataArray objectAtIndex:section] cities].count;
}
//每个成员
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* str=@"tableCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"str"];
        
    }
    cityGroupModel *md=[_dataArray objectAtIndex:indexPath.section];
    cell.textLabel.text=md.cities[indexPath.row];
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    cityGroupModel *md=[_dataArray objectAtIndex:section];
    return md.title;
    
}
//通过通知中心，选中一个城市时，传值给通知中心
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // NSLog(@"1");
    cityGroupModel *md=[_dataArray objectAtIndex:indexPath.section];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"cityDidChanged" object:nil userInfo:@{@"cityName":md.cities[indexPath.row]}];
    //NSLog(@"2");
    [self dismissViewControllerAnimated:YES completion:nil];
     // NSLog(@"3");
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    self.coverView.hidden=NO;
   [self.navigationController setNavigationBarHidden:YES animated:YES];
}
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    self.coverView.hidden=YES;
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length) {
        
        self.searchResultVC.view.hidden=NO;
        self.searchResultVC.searchText=searchText;
        
    } else {
        self.searchResultVC.view.hidden=YES;
    }
}
- (SearchCityResultViewController *)searchResultVC{
    //懒加在
    if (!_searchResultVC) {
       
        self.searchResultVC = [[SearchCityResultViewController alloc]init];
        //将搜索结果VC添加到当前控制器中
        [self.view addSubview:_searchResultVC.view];
        //添加约束 设置搜索结果控制器的尺寸位置
        [self.searchResultVC.view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        //让searchResultVC的顶部 贴着搜索框的底部  不遮盖住搜索框
        [self.searchResultVC.view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.searchBar];
        
        
    }
    return _searchResultVC;
}


@end
