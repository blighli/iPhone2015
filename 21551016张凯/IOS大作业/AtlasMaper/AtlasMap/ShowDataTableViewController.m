//
//  ShowDataTableViewController.m
//  AtlasMap
//
//  Created by Atlas on 15/12/25.
//  Copyright © 2015年 Atlas. All rights reserved.
//

#import "ShowDataTableViewController.h"
#import "MapViewController.h"
#import <MapKit/MapKit.h>


@interface ShowDataTableViewController ()

@property (nonatomic, strong) NSMutableArray * talbeViewArray;
@property (nonatomic, strong) MKLocalSearch *localSearch;
@property (nonatomic) MKCoordinateRegion currenRegion;

@end

static NSString *tableViewKey = @"key";

@implementation ShowDataTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if(self){
        _talbeViewArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"地点选择"];
//    NSLog(@"userSelect:%@",self.searchString);
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewKey];
//    [_talbeViewArray addObject:@{@"siteName":@"地点一",
//                                 @"siteLocation":@"123",
//                                 }];
    
    
    
    if (_localSearch != nil) {
        _localSearch = nil;
    }
    //显示 loading 提示
    [self.tableView setBounces:NO];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    UILabel *TableLoading = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 100)/2, (self.view.frame.size.height - 20)/2 - 44, 100, 20)];
    [TableLoading setText:@"waiting ..."];
    [self.view addSubview:TableLoading];
    
    
    
    MKLocalSearchRequest *searchRequest = [[MKLocalSearchRequest alloc]init];
    searchRequest.naturalLanguageQuery = self.searchString;
    MKCoordinateRegion region =
        MKCoordinateRegionMakeWithDistance(
                        CLLocationCoordinate2DMake(29.890173, 121.640257),
                        2000,
                        2000);
    searchRequest.region = region;
    
    
    
    _localSearch = [[MKLocalSearch alloc]initWithRequest:searchRequest];
    [_localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        
        
        //移除 loading 提示
        [TableLoading removeFromSuperview];
        
        if (response.mapItems.count == 0 || error) {
            //没有返回数据
            NSLog(@"%@",error);
        }else{
            //有返回的数据
            [_talbeViewArray addObjectsFromArray:response.mapItems];
            
            [self.tableView setBounces:YES];
            [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
            [self.tableView reloadData];
            
            self.currenRegion = response.boundingRegion;
        }
    }];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnPre)];
    
    
    
}

- (void) returnPre{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _talbeViewArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewKey forIndexPath:indexPath];
    
    // Configure the cell...
    
//    NSDictionary *dic = _talbeViewArray[indexPath.row];
//    [cell.textLabel setText:dic[@"siteName"]];
    
    MKMapItem *item = _talbeViewArray[indexPath.row];
    [cell.textLabel setText:item.name];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MapViewController *mapViewController = [[MapViewController alloc]init];
    
    mapViewController.mapItem = _talbeViewArray[indexPath.row];
    mapViewController.region = self.currenRegion;
    
    [self.navigationController pushViewController:mapViewController animated:YES];
}


@end
