//
//  MapViewController.m
//  MyLBS
//
//  Created by helmsmanmac on 15/9/2.
//  Copyright (c) 2015年 helmsmanmac. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()<MKMapViewDelegate>

@property (nonatomic, strong) MKMapView * mapView;
@property (nonatomic, strong) CLLocationManager * locationManager;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor             = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self setTitle:@"线路导航"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(returnPre)];
    
    _mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    [_mapView setShowsUserLocation:YES];
    [_mapView setDelegate:self];
    [self.view addSubview:_mapView];

    MKPointAnnotation * annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = self.mapItem.placemark.location.coordinate;
    [annotation setTitle:self.mapItem.name];
    [_mapView addAnnotation:annotation];
    [_mapView setRegion:[_mapView regionThatFits:self.region] animated:YES];
    
    if(_locationManager == nil){
        _locationManager = [[CLLocationManager alloc] init];
        
        if([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
            [_locationManager requestWhenInUseAuthorization];
        }
    }
    
//    确定自己的位置，并绘制一条路径到目的地
    [self createLineFromCurrentSite:[MKMapItem mapItemForCurrentLocation] to:self.mapItem];
}

- (void)createLineFromCurrentSite:(MKMapItem *)fromItem to:(MKMapItem *)toItem {
    
    MKDirectionsRequest * request = [[MKDirectionsRequest alloc] init];
//    no表示只显示一条路径
    [request setRequestsAlternateRoutes:NO];
    [request setSource:fromItem];
    [request setDestination:toItem];
    MKDirections * directions = [[MKDirections alloc] initWithRequest:request];
    
//    if(directions.calculating){
//        [directions cancel];
//    }
    
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if(error || response.routes == 0){
            NSLog(@"error:%@",error);
        }else{
            for(MKRoute * rote in response.routes){
                [_mapView addOverlay:rote.polyline level:MKOverlayLevelAboveRoads];
                for(MKRouteStep * step in rote.steps){
                    NSLog(@"step:%@",step.instructions);
                }
            }
        }
    }];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    if([overlay isKindOfClass:[MKPolyline class]]){
        MKPolylineRenderer * render = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
        [render setLineWidth:5.0];
        [render setStrokeColor:[UIColor redColor]];
        return render;
    }else return nil;
}


- (void)returnPre {
    [self.navigationController popViewControllerAnimated:YES];
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
