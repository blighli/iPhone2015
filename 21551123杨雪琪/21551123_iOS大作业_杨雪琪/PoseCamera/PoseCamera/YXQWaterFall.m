//
//  YXQWaterFall.m
//  PoseCamera
//
//  Created by YXQ on 15/12/28.
//  Copyright © 2015年 YXQ. All rights reserved.
//

#import "YXQWaterFall.h"
#import "YXQWaterFallCell.h"
#import "YXQPictureSureView.h"

#define CELL_IDENTIFIER @"WaterfallCell"

@interface YXQWaterFall()
@property (nonatomic, strong) NSArray *cellSizes;
@property (nonatomic, strong) NSArray *cellContents;
@end

@implementation YXQWaterFall

#pragma mark - Accessors

- (void)setCellSizes:(NSArray *)sizes {
    _cellSizes = sizes;
}

- (void)setCellContents:(NSArray *)contents {
    _cellContents = contents;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.footerHeight = 10;
        layout.minimumColumnSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = bgColor;
        [_collectionView registerClass:[YXQWaterFallCell class] forCellWithReuseIdentifier:CELL_IDENTIFIER];
    }
    return _collectionView;
}

#pragma mark - Life Cycle

- (void)dealloc
{
    _collectionView.delegate = nil;
    _collectionView.dataSource = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self updateLayoutForOrientation:[UIApplication sharedApplication].statusBarOrientation];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self updateLayoutForOrientation:toInterfaceOrientation];
}

- (void)updateLayoutForOrientation:(UIInterfaceOrientation)orientation
{
    CHTCollectionViewWaterfallLayout *layout = (CHTCollectionViewWaterfallLayout *)self.collectionView.collectionViewLayout;
    layout.columnCount = UIInterfaceOrientationIsPortrait(orientation) ? 2 : 3;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _cellContents.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YXQWaterFallCell *cell = (YXQWaterFallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:self.cellContents[indexPath.item]];
    return cell;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.cellSizes[indexPath.item] CGSizeValue];
}

#pragma mark - UIColloctionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YXQImgEntity *imgEntity = [YXQImgEntity sharedModel];
    imgEntity.imgIndex = indexPath.row;
    imgEntity.tabTitle = self.tabTitle;
    YXQPictureSureView *pictureSureView = [[YXQPictureSureView alloc] init];
    [self.navigationController pushViewController:pictureSureView animated:YES];
}

@end

