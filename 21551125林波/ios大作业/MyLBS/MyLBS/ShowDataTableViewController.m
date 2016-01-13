//
//  ShowDataTableViewController.m
//  MyLBS
//
//  Created by helmsmanmac on 15/9/2.
//  Copyright (c) 2015年 helmsmanmac. All rights reserved.
//

#import "ShowDataTableViewController.h"
#import "MapViewController.h"
#import <MapKit/MapKit.h>

@interface ShowDataTableViewController ()

@property (nonatomic, strong) NSMutableArray * talbeViewArray;
@property (nonatomic, strong) MKLocalSearch * localSearch;
@property (nonatomic)    MKCoordinateRegion currentRegion;

//@property (nonatomic,retain) CLLocationManager * locationManager;
//@property (strong, nonatomic) CLLocation *checkinLocation;
//@property (strong, nonatomic) NSString *currentLatitude; //纬度
//@property (strong, nonatomic) NSString *currentLongitude; //经度



@end

static NSString * tableViewKey = @"key";

@implementation ShowDataTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if(self){
        _talbeViewArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"地点选择"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewKey];
//    [_talbeViewArray addObject:@{@"siteName":@"地点一",
//                                 @"siteLocation":@"",
//                                 }];
    
//    116.500855,39.930871
    
//    if(_localSearch.searching){
//        [_localSearch cancel];
//    }
//    
//    if ([CLLocationManager locationServicesEnabled]) {
//        self.locationManager = [[CLLocationManager alloc] init];
//        self.locationManager.delegate = self;
//    }else{
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"无法进行定位操作" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alert show];
//    }
//    [self.locationManager startUpdatingLocation];
    
    
    if(_localSearch != nil){
        _localSearch = nil;
    }
    
//    添加一个标签控件，用于显示 "查找中..."
    UILabel * loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, (self.view.frame.size.height-20)/2 -44, 100, 20)];
    [loadingLabel setText:@"查找中..."];
    [self.view addSubview:loadingLabel];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    MKLocalSearchRequest * searchRequest = [[MKLocalSearchRequest alloc] init];
    searchRequest.naturalLanguageQuery = self.searchString;
//    围绕39.930871, 116.500855这个中心点上下左右2000米的地域
//    NSLog(@" 去你妹的%lf %lf",self.currentLatitude.doubleValue,self.currentLongitude.doubleValue);
//    NSLog(@" 去你妹的%@ %@",self.currentLatitude,self.currentLongitude);
//    29.888556,121.64045
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(29.888556,121.64045), 2000, 2000);
    searchRequest.region = region;
    
    _localSearch = [[MKLocalSearch alloc] initWithRequest:searchRequest];
    [_localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
       
        [loadingLabel removeFromSuperview];
        
        if(response.mapItems.count == 0 || error){
            NSLog(@"error:%@",error);
        }else{
            [_talbeViewArray addObjectsFromArray:response.mapItems];
            self.currentRegion = response.boundingRegion;
            [self.tableView setBounces:YES];
            [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
            [self.tableView reloadData];
        }
    }];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnPre)];
}




//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
//    self.checkinLocation = [locations lastObject];
//    CLLocationCoordinate2D cool = self.checkinLocation.coordinate;
//    self.currentLatitude  = [NSString stringWithFormat:@"%.5f",cool.latitude];
//    self.currentLongitude = [NSString stringWithFormat:@"%.5f",cool.longitude];
//    
//    NSLog(@"%@,%@",self.currentLatitude,self.currentLongitude);
//}




- (void)returnPre {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _talbeViewArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewKey forIndexPath:indexPath];
    
    MKMapItem * item = _talbeViewArray[indexPath.row];
    
    [cell.textLabel setText:item.name];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MapViewController * mapViewController = [[MapViewController alloc] init];
    mapViewController.mapItem = _talbeViewArray[indexPath.row];
    mapViewController.region = self.currentRegion;
    [self.navigationController pushViewController:mapViewController animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
