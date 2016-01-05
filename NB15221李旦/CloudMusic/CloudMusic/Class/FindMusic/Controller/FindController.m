//
//  FindController.m
//  CloudMusic
//
//  Created by LiDan on 15/12/6.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "FindController.h"
#import "CloudMusic.pch"
#import "SearchBar.h"

@interface FindController()<UIScrollViewDelegate>

@property (nonatomic,weak) SearchBar *searchBar;

@end

@implementation FindController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    SearchBar * searchBar = [SearchBar searchBar];
    searchBar.width = 300;
    searchBar.height = 30;
    self.searchBar = searchBar;
    self.navigationItem.titleView = searchBar;
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.searchBar endEditing:YES];
}

@end
