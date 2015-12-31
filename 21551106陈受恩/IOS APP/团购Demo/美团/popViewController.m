//
//  popViewController.m
//  meituan
//
//  Created by 陈受恩 on 15/12/9.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "popViewController.h"
#import "popview.h"
#import "CategoryModel.h"
@interface popViewController ()<MyPopviewDataSource,MyPopviewDelegate>{
    NSArray *_categoryArr;
    CategoryModel * _selectedModel;
}

@end

@implementation popViewController

- (void)viewDidLoad {
    //获取所有数据模型
    _categoryArr=[self getData];

    [super viewDidLoad];
     popview *pop=[popview makePopView];
    // 设置当前viewController为dataSource
    pop.dataSource=self;
    pop.delegate=self;
    [self.view addSubview:pop];
    pop.categoryArr=[self getData];
    pop.autoresizingMask=UIViewAutoresizingNone;
    self.preferredContentSize=CGSizeMake(pop.frame.size.width, pop.frame.size.height);
    
 
}
-(NSArray*)getData{
    CategoryModel *md=[[CategoryModel alloc]init];
    NSArray *categoryArray=[md loadPlistData];
    return categoryArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 遵行MyPopviewDataSource 协议,实现方法

-(NSInteger)numberOfRowsInLeftTable:(popview *)popview{
    return  _categoryArr.count;
}
-(NSString *)popview:(popview *)popview titleForRow:(NSInteger)row{
    return [_categoryArr[row] name];
}
-(NSString *)popview:(popview *)popview imageForRow:(NSInteger)row{
    return [_categoryArr[row] small_icon];
}
-(NSArray *)popview:(popview *)popview subDataForRow:(NSInteger)row{
    return [_categoryArr[row] subcategories];
}

#pragma mark 遵行MyPopviewDelegate 协议，实现方法

-(void)popview:(popview *)popview didSelectRowAtLeftTable:(NSUInteger)row{
   
    NSArray * categoryArray=[self getData];
    //CategoryModel *md=categoryArray[row];
    _selectedModel=categoryArray[row];
    if (!_selectedModel.subcategories.count) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"categoryDidChanged" object:nil userInfo:@{@"categoryModel":_selectedModel}];

}
}

-(void)popview:(popview *)popview didSelectRowAtRightTable:(NSUInteger)row{
    
    NSArray * subArr=_selectedModel.subcategories;
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"subCategoryDidChanged" object:nil userInfo:@{@"categoryModel":_selectedModel,@"subCategoryName":subArr[row]}];
    [self dismissViewControllerAnimated:YES completion:nil];
        
}



@end

