//
//  FirstViewController.m
//  postCard
//
//  Created by 毛毛 on 15/12/15.
//  Copyright (c) 2015年 毛毛. All rights reserved.
//

#import "FirstViewController.h"
#import "StampsCell.h"
#import "NoteViewController.h"


@interface FirstViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation FirstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.tabBarItem.selectedImage = [[UIImage imageNamed:@"huapenS.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self layoutCollectionView];
    
    
}

- (void)layoutCollectionView
{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setItemSize:CGSizeMake(CELLWIDTH, CELLHEIGHT)];
    [flow setMinimumLineSpacing:20];
    [flow setSectionInset:UIEdgeInsetsMake(15, 15, 0, 15)];
    [flow setMinimumInteritemSpacing:10];
    
    self.firCollect = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 114) collectionViewLayout:flow];
    UIImageView *ima = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back9.jpg"]];
    [_firCollect setBackgroundView:ima];
    
    _firCollect.dataSource = self;
    _firCollect.delegate = self;
    
    [self.view addSubview:_firCollect];
    
    [_firCollect registerClass:[StampsCell class] forCellWithReuseIdentifier:@"pool"];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    StampsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pool" forIndexPath:indexPath];
    
    NSString *pic = [NSString stringWithFormat:@"%ld.png", (long)indexPath.item];

    [cell.picimage setImage:[UIImage imageNamed:pic]];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NoteViewController *note = [[NoteViewController alloc] init];
    NSString *str = [NSString stringWithFormat:@"%ld.png", (long)indexPath.item];
    [note getPic:str];
    note.HasValue = @"NoValue";
    [self.navigationController pushViewController:note animated:YES];
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
