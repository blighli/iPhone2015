//
//  SearchCityResultViewController.m
//  美团
//
//  Created by 陈受恩 on 15/12/10.
//  Copyright © 2015年 chenshouen. All rights reserved.
//
#import "Cities.h"
#import "SearchCityResultViewController.h"

@interface SearchCityResultViewController (){
    NSMutableArray *_searchResultArray;
}

@end

@implementation SearchCityResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setSearchText:(NSString *)searchText{
    //传值成功
    _searchText=[searchText lowercaseString];
    _searchResultArray=[[NSMutableArray alloc]init];
   // NSLog(@"%@",_searchText);
    //获取城市模型
    if(!_citiesArray){
       // NSLog(@"1");
        _citiesArray=[Cities getCities];
      //  NSLog(@"2");
        //NSLog(@"%@",_citiesArray);
    }
    //判断搜索结果城市
    for (Cities *city in _citiesArray) {
        if ([city.name containsString:_searchText]||[city.pinYin containsString:_searchText]||[city.pinYinHead containsString:_searchText]) {
             //NSLog(@"xiao de %@",city);
            [_searchResultArray addObject:city];
        }
    }
    //NSLog(@"%@",_searchResultArray);
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _searchResultArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
   
    static NSString *str=@"searchCell";
    //如果不是拖的控件，则需要注册。
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:str];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str forIndexPath:indexPath];
   
    if (cell==nil) {
       cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str] ;
     }
 
     Cities *city=[_searchResultArray objectAtIndex:indexPath.row];
     cell.textLabel.text=city.name;    
    return cell;
}



@end
