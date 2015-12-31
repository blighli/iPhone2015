//
//  MainListCollectionViewController.m
//  WordNote
//
//  Created by 常惠源 on 12/22/15.
//  Copyright © 2015 ZJU. All rights reserved.
//

#import "MainListCollectionViewController.h"
#import "MainListCollectionViewCell.h"
#import "FileNameView.h"
#import "CustomFileListTableViewController.h"
#import "FileListTableViewController.h"
#import "CoreDataManagerHelp.h"
#import "CustomFile.h"
#import "THLongPressGestureRecognizer.h"
#import "LOCollectionRV.h"

#define k_CustomFile @"自定义分类"
#define k_File @"默认"
@interface MainListCollectionViewController ()<UITextFieldDelegate,UIAlertViewDelegate>
@property (nonatomic, strong)NSMutableDictionary *ListDictionary; //对应列表字典
@property (nonatomic, strong)FileNameView *fileNameView;    //弹出自定义文件名视图
@property (nonatomic, strong)NSMutableArray *customArray;   //自定义文件数组
@property (nonatomic, copy)void (^block)();

@end

@implementation MainListCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Eric.Library";
    self.navigationController.navigationBar.translucent = YES;
    self.collectionView.backgroundColor = [UIColor k_InterfaceColor];
    //添加CollectionView布局对象
    [self CollectionViewFlowLayoutAction];
    //查找coreData数组
    [self addCustomArrayAction];
    //添加字典
    [self addListDictionaryAction];
}
#pragma mark - 初始化控制器
#pragma mark 查找coreData数组
- (void)addCustomArrayAction{
    [self.customArray removeAllObjects];
    NSArray *array = [[CoreDataManagerHelp defaultCoreDataManagerHelp] demandCustomArray];
    [self.customArray addObjectsFromArray:array];
}
#pragma mark 添加字典
- (void)addListDictionaryAction{
    [self.ListDictionary setObject:self.customArray forKey:k_CustomFile];
    [self.ListDictionary setObject:@"默认记事本" forKey:k_File];

    [self.collectionView reloadData];
}
#pragma mark 添加CollectionView布局对象
- (void)CollectionViewFlowLayoutAction{
    //创建布局对象 UICollectionViewFlowLayout
    UICollectionViewFlowLayout * collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc]init];
    collectionViewFlowLayout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 5);
    //设置item大小
    collectionViewFlowLayout.itemSize = CGSizeMake(110, 60);
    //设置每列最小间距
    collectionViewFlowLayout.minimumInteritemSpacing = 10;
    //设置最小列间距
    collectionViewFlowLayout.minimumLineSpacing = 10;
    //设置item内边距大小 上 左 下 右
    collectionViewFlowLayout.sectionInset = UIEdgeInsetsMake(15, 5, 5, 5);
    self.collectionView.collectionViewLayout = collectionViewFlowLayout;
}
#pragma mark - 字典与数组懒加载
- (NSMutableDictionary *)ListDictionary{
    if (!_ListDictionary) {
        _ListDictionary = [NSMutableDictionary dictionary];
    }
    return _ListDictionary;
}
- (NSMutableArray *)customArray{
    if (!_customArray) {
        _customArray = [NSMutableArray array];
    }
    return _customArray;
}
#pragma mark  - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //每组有几个
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return self.customArray.count + 1;
            break;
            
        default:
            return 0;
            break;
    }
}

/** 创建item */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MainListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.FileLabel.font = [UIFont systemFontOfSize:13];
    cell.FileLabel.numberOfLines = NO;
    cell.dateLabel.text = @"";
    cell.layer.borderColor=[UIColor darkGrayColor].CGColor;
    cell.layer.borderWidth=0.5;
    cell.layer.cornerRadius = 5;
    cell.layer.masksToBounds = YES;
    cell.FileLabel.textColor = [UIColor blackColor];
    switch (indexPath.section) {
        case 0:
            cell.FileLabel.text = _ListDictionary[k_File];
            break;
        default:
            if (indexPath.item == 0) {
                cell.FileLabel.text = @"新建";
                cell.FileLabel.textColor = [UIColor blackColor];
                cell.FileLabel.font = [UIFont systemFontOfSize:20];
            }else{
                CustomFile *custom = _ListDictionary[k_CustomFile][indexPath.item - 1];
                cell.FileLabel.text = custom.name;
                cell.FileLabel.font = [UIFont systemFontOfSize:14];
                cell.dateLabel.text = [[CoreDataManagerHelp defaultCoreDataManagerHelp] setDateToString:custom.date];
                cell.dateLabel.textAlignment = NSTextAlignmentCenter;
                cell.dateLabel.font = [UIFont systemFontOfSize:6];
                //添加手势
                THLongPressGestureRecognizer * longPressGr = [[THLongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
                longPressGr.indexPath = indexPath;
                longPressGr.minimumPressDuration = 0.5;
                [cell addGestureRecognizer:longPressGr];
            }
            break;
    }
    
    return cell;
}

/** 长按手势 */
- (void)longPressToDo:(THLongPressGestureRecognizer *)longPressGr{
    if(longPressGr.state == UIGestureRecognizerStateBegan)
    {
//        NSLog(@"%d",longPressGr.view.tag);
        __block MainListCollectionViewController *men = self;
        self.block = ^(){
            CustomFile *custom = men.ListDictionary[k_CustomFile][longPressGr.indexPath.item - 1];
            [[CoreDataManagerHelp defaultCoreDataManagerHelp] removeCustomObject:custom];
            [men addCustomArrayAction];
            [men addListDictionaryAction];
        };
        CustomFile *customa = self.ListDictionary[k_CustomFile][longPressGr.indexPath.item - 1];
        NSString *str = customa.name;
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"是否要删除该分类" message:str delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
        alertView.tag = 3000;
        [alertView show];
    }
}

#pragma mark collectionViewItem 点击方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            FileListTableViewController *fileVC = [[FileListTableViewController alloc]init];
            fileVC.title = @"归档";
            [self.navigationController pushViewController:fileVC animated:YES];
            }
            break;
        default:
            if (indexPath.item == 0){
                _fileNameView = [[FileNameView alloc]initWithFrame:self.view.frame];
                _fileNameView.fileNameField.delegate = self;
                [self.view addSubview:_fileNameView];
            }else{
                CustomFileListTableViewController *customVC = [[CustomFileListTableViewController alloc]init];
                CustomFile *cust = self.customArray[indexPath.item - 1];
                customVC.title = cust.name;
                customVC.customFile = cust;
                [self.navigationController pushViewController:customVC animated:YES];
            }
            break;
    }
}


#pragma mark - 添加自定义文件夹方法
- (void)addCustomFile{
    if (_fileNameView.fileNameField.text.length != 0) {
        NSString *string = [_fileNameView.fileNameField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        for (CustomFile *custom in self.customArray) {
            if ([custom.name isEqualToString:string]) {
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"警告" message:@"文件夹重名,请重新输入名称" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alertView show];
                return;
            }
        }
        [[CoreDataManagerHelp defaultCoreDataManagerHelp] addCutomFileListName:string];
        [self addCustomArrayAction];
        [self addListDictionaryAction];
    }
    [_fileNameView removeFromSuperview];
}
#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 3000) {
        if (buttonIndex == 1) {
            self.block();
        }
    }else{
        _fileNameView.fileNameField.text = @"";
    }
}
#pragma mark UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        [self addCustomFile];
    }
    return YES;
}
@end
