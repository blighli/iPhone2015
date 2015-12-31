//
//  FirstViewController.m
//  meituan
//
//  Created by 陈受恩 on 15/12/8.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "FirstViewController.h"
#import "NavItem.h"
#import "NavItem2.h"
#import "NavItem3.h"
#import "popViewController.h"
#import "secondPopViewController.h"
#import "cityGroupModel.h"
#import "CategoryModel.h"
#import "DPAPI.h"
#import "deal Model.h"
#import "MianCollectionViewCell.h"
#import "MJRefresh.h"
#import "detailViewController.h"
#import "UIBarButtonItem+ZYExtension.h"
#import "SortViewController.h"
#import "Sort.h"
#import "DPRequest.h"
#import "Region.h"
#import "Cities.h"
#import "NewsMenuViewController.h"



@interface FirstViewController()<DPRequestDelegate>{
    UIBarButtonItem *firstItem;
    UIBarButtonItem *secondItem;
    UIBarButtonItem *thirdItem;
    
    NSMutableDictionary *params1;
}

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic,assign)int page;
/** 当前选中的分类名字 */
@property (nonatomic, copy) NSString *selectedCategory;
/** 当前选中的区域名字 */
@property (nonatomic, copy) NSString *selectedRegionName;
/** 当前选中的城市名字 */
@property (nonatomic, copy) NSString *selectedName;
/** 当前选中的排序 */
@property (nonatomic, strong) Sort *selectedSort;
@end


@implementation FirstViewController

static NSString* const reuseIdentifier=@"Main Cell";

-(instancetype)init{
    //初始化布局，设置每个cell的大小，cell间距
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize=CGSizeMake(300,300);
    layout.sectionInset=UIEdgeInsetsMake(20, 20, 20, 20);
    return [self initWithCollectionViewLayout:layout];
}
-(void)viewDidLoad{
    // 一些准备工作
    [super viewDidLoad];
    [self creatNavBar];
     self.collectionView.backgroundColor=[UIColor lightGrayColor];
    _dataSource=[[NSMutableArray alloc]init];
    cityGroupModel *md=[[cityGroupModel alloc]init];

    //注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"MianCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    //设置collectionView 一直可以上下刷新
    self.collectionView.alwaysBounceVertical=YES;
    //添加下拉刷新
    self.collectionView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self createRequest];
        [self.collectionView.header endRefreshing];
    }];
    //添加上拉加载
    self.collectionView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
        [self.collectionView.footer endRefreshing];
    }];

    //添加观察者，接受通知并将其绑定方法
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(categoryChange:) name:@"categoryDidChanged" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(subCategoryChange:) name:@"subCategoryDidChanged" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cityChange:)
        name:@"cityDidChanged" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(regionChange:) name:@"regionDidChanged" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sortChange:)
       name:@"sortDidChanged" object:nil];
    
    //这个是为了设置默认城市判别
    [self cityChange:nil];
}
#pragma mark 根据大众点评API发送网络请求
-(void)request{
    
    DPAPI *api=[[DPAPI alloc]init];
    params1=[[NSMutableDictionary alloc]init];
    [params1 setValue:self.selectedCategory forKey:@"category"];
    [params1 setValue:self.selectedName forKey:@"city"];
    if (self.selectedSort.value) {
        params1[@"sort"] = @(self.selectedSort.value);
    }
    // 区域
    if (self.selectedRegionName) {
        params1[@"region"] = self.selectedRegionName;
    }
    params1[@"page"]=@(self.page);
    params1[@"limit"]=@6;
    [api requestWithURL:@"v1/deal/find_deals" params:params1 delegate:self];
}
-(void)createRequest{
    self.page=1;
    [self request];
}
-(void)loadMoreData{
     self.page++;
    [self request];
}
-(void)request:(DPRequest *)request didFailWithError:(NSError *)error{
    NSLog(@"%@",error);
}
-(void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result{
    if (self.page == 1) {
        [self.dataSource removeAllObjects];
    }
    //NSLog(@"%@",result);
    NSDictionary *dict=result;
    deal_Model *md=[[deal_Model alloc]init];
    NSArray *arr=[md asignModelWithDict:dict];
    //追加新数据
    [self.dataSource addObjectsFromArray:arr];
    [self.collectionView reloadData];
    [self.collectionView.footer endRefreshing];
    [self.collectionView.header endRefreshing];
}
#pragma mark 通知绑定的方法
-(void)categoryChange:(NSNotification*)noti{
    CategoryModel *md=(CategoryModel *)noti.userInfo[@"categoryModel"];
    // NSLog(@"首页通过通知中心获得信息");
    //NSString *str=noti.userInfo[@"subCategoryName"];
    //NSLog(@"%@",md.name);
    //发送网络请求
    // item上面的文字同步刷新
//    NavItem *item = (NavItem *)self->firstItem.customView;
//    item.subTitle.text=nil;
//    item.title.text=[NSString stringWithFormat:@"%@",md.name];
    self.selectedCategory=md.name;
    [self createRequest];
}
-(void)subCategoryChange:(NSNotification*)noti{
   
    CategoryModel *md=(CategoryModel *)noti.userInfo[@"categoryModel"];
    NSString *str=noti.userInfo[@"subCategoryName"];
   // NSLog(@"左表：%@－－－－－   右表：%@",md.name,str);
    if (!md.subcategories.count) {
        self.selectedCategory=md.name;
    }else{
        if ([str isEqualToString:@"全部"]) {
            self.selectedCategory=md.name;
        }
        else{
            self.selectedCategory=str;
            
        }
    }
    NavItem *item = (NavItem *)self->firstItem.customView;
    item.title.text=[NSString stringWithFormat:@"%@",md.name];
    item.subTitle.text=[NSString stringWithFormat:@"%@",str];
    //发送网络请求
    [self createRequest];
}
-(void)cityChange:(NSNotification*)noti{
    
    NSString *cityName = noti.userInfo[@"cityName"];
    self.selectedName = cityName;
    // NSLog(@"%@",self.selectedName);
    //默认城市为宁波
    if (noti == nil) {
        self.selectedName = @"宁波";
        //NSLog(@"%@",self.selectedName);
    }
    // item上面的文字同步刷新
    NavItem2 *item = (NavItem2 *)self->secondItem.customView;
    item.subtitle.text=[NSString stringWithFormat:@"%@ - 全部",self.selectedName];
    item.title.text=nil;
    [self createRequest];
}

- (void)regionChange:(NSNotification *)noti
{
    
    Region *region = noti.userInfo[@"regionName"];
    //NSLog(@"++++++%@",region.name);
    NSString *subReginName = noti.userInfo[@"subRegionName"];
    if (subReginName == nil || [region.name isEqualToString:@"全部"]) {
        self.selectedRegionName = nil;
    }
    else{
        self.selectedRegionName = subReginName;
    }
    
    if ([subReginName isEqualToString:@"全部"]) {
        self.selectedRegionName = nil;
    }
    

    NavItem2 *item = (NavItem2 *)self->secondItem.customView;
    NSString *regionName = region.name;
    
    if (regionName == nil) {
        regionName = @"全部";
    }  
    item.subtitle.text=[NSString stringWithFormat:@"%@ - %@",_selectedName,regionName];
    item.title.text=subReginName;

    //发送网络请求
    [self createRequest];
}

- (void)sortChange:(NSNotification *)notification{
    
    self.selectedSort = notification.userInfo[@"sortName"];
    NavItem3 *item = (NavItem3 *)self->thirdItem.customView;
    item.subtitle.text=self.selectedSort.label;
    [self createRequest];
    
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
#pragma mark 创建导航栏
-(void)creatNavBar{
    UIBarButtonItem *logo=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_meituan_logo"]style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.leftBarButtonItem=logo;
    
    NavItem *first=[NavItem makeItem1];
    [first addTarget:self action:@selector(firstClick)];
    NavItem2 *second=[NavItem2 makeItem2];
    [second addTarget:self action:@selector(secondClick)];
    NavItem3 *third=[NavItem3 makeItem3];
    [third addTarget:self action:@selector(thirdClick)];
    
    firstItem=[[UIBarButtonItem alloc]initWithCustomView:first];
    secondItem=[[UIBarButtonItem alloc] initWithCustomView:second];
    thirdItem=[[UIBarButtonItem alloc]initWithCustomView:third];
    
     UIBarButtonItem *otherItem = [UIBarButtonItem barButtonItemWithTarget:self action:@selector(didClickOtherItem) normalImage:@"icon_pathMenu_more_highlighted" highImage:@"icon_pathMenu_more_highlighted"];
    
    self.navigationItem.leftBarButtonItems=@[logo,firstItem,secondItem,thirdItem];
    self.navigationItem.rightBarButtonItems=@[otherItem];
    self.navigationController.navigationBar.autoresizingMask=UIViewAutoresizingNone;
}

#pragma mark 添加点击事件
-(void)firstClick{
    //NSLog(@"1");
    [self creatPopver1];
}
-(void)secondClick{
    // NSLog(@"2");
    [self creatPopver2];

}
-(void)thirdClick{
    // NSLog(@"3");
   [self creatPopver3];

}
-(void)didClickOtherItem{
    // NSLog(@"4");
    NewsMenuViewController *newVC = [[NewsMenuViewController alloc] init];
    [self.navigationController pushViewController:newVC animated:YES];
}

#pragma mark  创建下拉菜单
-(void)creatPopver1{
    popViewController *pvc=[[popViewController alloc]init];
    UIPopoverController *pop=[[UIPopoverController alloc]initWithContentViewController:pvc];
    
    [pop presentPopoverFromBarButtonItem:firstItem
                permittedArrowDirections:UIPopoverArrowDirectionAny
                                animated:YES];
}
-(void)creatPopver2{
    secondPopViewController *pvc=[[secondPopViewController alloc]initWithNibName:@"secondPopViewController" bundle:nil];
    UIPopoverController *pop=[[UIPopoverController alloc]initWithContentViewController:pvc];
    
    if(self.selectedName){
        Cities *city = [[[Cities cities] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name = %@",self.selectedName]] lastObject];
        pvc.regions = city.regions;
    }else{
        self.selectedName=@"宁波";
        Cities *city = [[[Cities cities] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name = %@",self.selectedName]] lastObject];
        pvc.regions = city.regions;
    }
     [pop presentPopoverFromBarButtonItem:secondItem
                permittedArrowDirections:UIPopoverArrowDirectionAny
                                animated:YES];
    
}
-(void)creatPopver3{
   
    SortViewController *svc = [[SortViewController alloc] init];
    UIPopoverController *pop= [[UIPopoverController alloc] initWithContentViewController:svc];
    [pop presentPopoverFromBarButtonItem:thirdItem
                permittedArrowDirections:UIPopoverArrowDirectionAny
                                animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 屏幕旋转,设置间距
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    int num=2;
    if (size.width==1024) {
        num=3;
    }
    UICollectionViewFlowLayout *layout=(UICollectionViewFlowLayout *)self.collectionViewLayout;
    CGFloat insect=(size.width-num*layout.itemSize.width)/(num+1);
    // cell之间的间距和上下的间距
    layout.sectionInset=UIEdgeInsetsMake(insect, insect, insect, insect);
    layout.minimumLineSpacing=insect;
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //在这里设置屏幕的间距，使数据加载成功便可以显示layout
    [self viewWillTransitionToSize:collectionView.frame.size withTransitionCoordinator:nil];
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   
    MianCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    deal_Model *md = _dataSource[indexPath.item];
    [cell showUIWithModel:md];
    return cell;
}
//选中一个Item 跳出商品详情
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    detailViewController *dvc=[[detailViewController alloc]initWithNibName:@"detailViewController" bundle:nil];
    //取item中的model
    dvc.md=_dataSource[indexPath.item];
    [self.navigationController pushViewController:dvc animated:YES];
}


#pragma mark <UICollectionViewDelegate>

@end
