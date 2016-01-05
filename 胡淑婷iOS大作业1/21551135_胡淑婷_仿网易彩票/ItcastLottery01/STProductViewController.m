//
//  STProductViewController.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/28.
//  Copyright © 2015年 HST. All rights reserved.
//

#define STProductCellID @"product"

#import "STProductViewController.h"
#import "STProduct.h"
#import "STProductCell.h"

@interface STProductViewController ()
@property(nonatomic,strong)NSArray *products;
@end

@implementation STProductViewController

-(NSArray *)products
{
    if (_products==nil) {
        
        //JSON文件的路径
        NSString *path=[[NSBundle mainBundle]pathForResource:@"products.json" ofType:nil];
        
        //加载JSON文件
        NSData *data=[NSData dataWithContentsOfFile:path];
        
        //将JSON数据转换为NSArray或者NSDictionary
        NSArray *dictArray=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        //将字典转成模型
        NSMutableArray *productArray=[NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            STProduct *p=[STProduct productWithDict:dict];
            [productArray addObject:p];
        }
        
        _products=productArray;
    }
    return _products;
}
-(instancetype)init
{
    //1.流水布局
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    
    //2.每个cell的尺寸
    layout.itemSize=CGSizeMake(100, 100);
    
    //3.设置cell之间水平间距
    layout.minimumInteritemSpacing=0;
    
    //4.设置cell之间垂直间距
    layout.minimumLineSpacing=10;
    
    //5.设置四周的内边距
    //top:100  left:10  bottom:50 right:70
    layout.sectionInset=UIEdgeInsetsMake(layout.minimumLineSpacing+10, 0, 0, 0);
    
    return [super initWithCollectionViewLayout:layout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // 1。注册cell（告诉collectionView）将来创建怎样的cell）
    UINib *nib=[UINib nibWithNibName:@"STProductCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:STProductCellID];
    
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:STProductCellID];
    
    //2.设置collectionView的背景色
    self.collectionView.backgroundColor=[UIColor whiteColor];
    
}

#pragma mark <UICollectionViewDataSource>

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //1.获得cell
    STProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:STProductCellID forIndexPath:indexPath];
    
    //2.传递模型
    cell.product=self.products[indexPath.row];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    STProduct *p=self.products[indexPath.item];
    NSURL *customUrl=[NSURL URLWithString:[NSString stringWithFormat:@"%@://%@",p.scheme,p.identifier]];
    UIApplication *app=[UIApplication sharedApplication];
    
    if ([app canOpenURL:customUrl]) {//有安装应用
        //打开应用
        [app openURL:customUrl];
    }else{//没有安装应用
        //打开appStore
        [app openURL:[NSURL URLWithString:p.url]];
    }
}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
