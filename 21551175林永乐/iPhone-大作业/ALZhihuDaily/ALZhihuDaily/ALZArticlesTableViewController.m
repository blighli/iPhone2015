//
//  ALZArticlesTableViewController.m
//  ALZhihuDaily
//
//  Created by alezai on 16/1/1.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "ALZArticlesTableViewController.h"
#import "ALZArticlesViewModel.h"
#import "ALZArticleTableCell.h"
#import "ALZBannerView.h"
#import "ALZArticleViewController.h"
#import <MJRefresh.h>
#import "SWRevealViewController.h"
#import "ALZNavgationView.h"
#import <UIImageView+AFNetworking.h>
#import "LaunchImage.h"

@interface ALZArticlesTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) ALZArticlesViewModel *viewModel;
@property (strong, nonatomic) ALZBannerView *bannerView;
@property (strong, nonatomic) ALZNavgationView *navgationView;
@property (strong, nonatomic) UIImageView *launchView;

@end

@implementation ALZArticlesTableViewController

NSString * const kReuseIdentifier = @"articleCell";

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //基本设置
    self.navigationController.navigationBar.hidden = YES;
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

    //子视图
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.navgationView];
    [self.view addSubview:self.launchView];

    //数据请求
    kWeakSelf(weakSelf);
    [self.viewModel requestLaunchImage:^(NSError *error) {
        if (!error) {
            [weakSelf.launchView setImageWithURL:[NSURL URLWithString:weakSelf.viewModel.launchImage.img]];
            UIImageView *imageView = [UIImageView new];
            [imageView setImage:[UIImage imageNamed:@"Logo"]];
            [weakSelf.launchView addSubview:imageView];
            
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(weakSelf.launchView);
                make.bottom.equalTo(weakSelf.launchView).offset(-10);
            }];
            [UIView animateWithDuration:2.5 animations:^{
                weakSelf.launchView.transform = CGAffineTransformMakeScale(1.2, 1.2);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:1.0 animations:^{
                    weakSelf.launchView.alpha = 0;
                } completion:^(BOOL finished) {
                    [weakSelf.launchView removeFromSuperview];
                }];
            }];
        }
    }];
    
    [self.viewModel refreshWithCallback:^(NSError *error) {
        [weakSelf.bannerView bindDataWithViewModel:[weakSelf.viewModel topStories]];
        
        [weakSelf.tableView reloadData];
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf.viewModel loadNextWithCallback:^(NSError *error) {
            [weakSelf.tableView.mj_footer endRefreshing];
            [weakSelf.tableView reloadData];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.bannerView addTimer];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.bannerView removeTimer];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor colorWithRed:1/255.0 green:131/255.0 blue:209/255.0 alpha:1];
    UILabel *label = [UILabel new];
    label.textColor = [UIColor whiteColor];
    label.text = [self.viewModel sectionTitleAtIndex:section];
    [headerView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(headerView);
    }];
    return headerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.viewModel numberOfSection];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfArticlesInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ALZArticleTableCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier forIndexPath:indexPath];
    Article *article = [self.viewModel articleAtIndex:indexPath];
    [cell bindDataWithArticle:article];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ALZArticleViewController *vc = [ALZArticleViewController new];
    Article *article = [self.viewModel articleAtIndex:indexPath];
    vc.ID = article.ID;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.isDragging || scrollView.isDecelerating) {
        [self.bannerView relayoutSubViewsWithOffset:scrollView.contentOffset];
        [self.navgationView updateStateWithOffset:scrollView.contentOffset.y];
    }
    for (SectionSeparate *sep in self.viewModel.separateArray) {
        if (scrollView.contentOffset.y > (sep.locationY - 24.0)) {
            if (![self.navgationView.titleLabel.text isEqualToString:sep.title]) {
                self.navgationView.titleLabel.text = sep.title;
            }
        }
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    kWeakSelf(weakSelf);
    if ([self.navgationView.loadCircleView.current isEqualToNumber:@100]) {
        [self.navgationView loading:^{
            [self.viewModel refreshWithCallback:^(NSError *error) {
                [weakSelf.bannerView bindDataWithViewModel:[weakSelf.viewModel topStories]];
                [weakSelf.tableView reloadData];
                [weakSelf.navgationView endLoading];
            }];
        }];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (!self.navgationView.loadCircleView.hidden) {
        self.navgationView.loadCircleView.hidden = YES;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y <= -20.0) {
        self.navgationView.loadCircleView.hidden = NO;
    }
}

#pragma mark - Getter and Setter

- (ALZArticlesViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [ALZArticlesViewModel new];
    }
    return _viewModel;
}

- (ALZBannerView *)bannerView{
    if (!_bannerView) {
        CGFloat width = [[UIScreen mainScreen] bounds].size.width;
        _bannerView = [[ALZBannerView alloc] initWithFrame:CGRectMake(0, 0, width, 200)];
        _bannerView.underStatusbar = YES;
        kWeakSelf(weakSelf);
        _bannerView.TapCallBack = ^(NSInteger ID){
            ALZArticleViewController *vc = [ALZArticleViewController new];
            vc.ID = ID;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
    }
    return _bannerView;
}

- (ALZNavgationView *)navgationView{
    if (!_navgationView) {
        _navgationView = [[ALZNavgationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
        kWeakSelf(weakSelf);
        _navgationView.titleLabel.text = @"今日热闻";
        _navgationView.buttonCallBack = ^(UIButton *button){
            [weakSelf.revealViewController revealToggleAnimated:YES];
        };
    }
    return _navgationView;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.bannerView;
        _tableView.showsVerticalScrollIndicator = NO;
        [_tableView registerClass:[ALZArticleTableCell class] forCellReuseIdentifier:kReuseIdentifier];
    }
    return _tableView;
}

- (UIImageView *)launchView{
    if (!_launchView) {
        _launchView = [[UIImageView alloc] initWithFrame:self.view.frame];
        [_launchView setImage:[UIImage imageNamed:@"zhihuLaunchImage"]];
    }
    return _launchView;
}

@end
