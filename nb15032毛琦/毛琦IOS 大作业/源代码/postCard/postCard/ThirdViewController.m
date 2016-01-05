//
//  ThirdViewController.m
//  postCard
//
//  Created by 毛毛 on 15/12/15.
//  Copyright (c) 2015年 毛毛. All rights reserved.
//

#import "ThirdViewController.h"
#import "PostDataBase.h"
#import "PostModel.h"
#import "thirdCollectCell.h"
#import "NoteViewController.h"
#import "AboutViewController.h"

@interface ThirdViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.tabBarItem.selectedImage = [[UIImage imageNamed:@"ya.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.array = [PostDataBase selectAll];
    
    [self creatCollect];
    [self creatRightbutton];
    
    if ([_array count] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您还没有记录哦~" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    self.array = [PostDataBase selectAll];
    [self.collect reloadData];
}

#pragma mark collectionView
- (void)creatCollect
{
    UICollectionViewFlowLayout *lays = [[UICollectionViewFlowLayout alloc] init];
    [lays setItemSize:CGSizeMake(CELLWIDTH, CELLHEIGHT)];
    [lays setMinimumInteritemSpacing:20];
    
    self.collect = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-114) collectionViewLayout:lays];
    UIImageView *back = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back6.jpg"]];
    [_collect setBackgroundView:back];
    
    _collect.dataSource = self;
    _collect.delegate = self;
    [_collect registerClass:[thirdCollectCell class] forCellWithReuseIdentifier:@"thipool"];
    
    [self.view addSubview:_collect];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PostModel *model = [_array objectAtIndex:indexPath.item];
    thirdCollectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"thipool" forIndexPath:indexPath];
    
    cell.model = model;
    return cell;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_array count];
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NoteViewController *note = [[NoteViewController alloc] init];
    PostModel *model = [_array objectAtIndex:indexPath.item];
    [note getModel:model];
    [note getPic:model.stamp];
    note.HasValue = @"HasValue";
    [self.navigationController pushViewController:note animated:YES];
    
}

#pragma mark rightButton
- (void)creatRightbutton
{
    UIButton *right = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [right setBackgroundImage:[UIImage imageNamed:@"face2.png"] forState:UIControlStateNormal];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:right]];
    [right addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)rightAction:(id)sender
{
    AboutViewController *about = [[AboutViewController alloc] init];
    [self presentViewController:about animated:YES completion:nil];
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
