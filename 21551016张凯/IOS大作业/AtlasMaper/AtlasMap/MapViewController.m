//
//  MapViewController.m
//  AtlasMap
//
//  Created by Atlas on 15/12/26.
//  Copyright © 2015年 Atlas. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()<MKMapViewDelegate>

@property (nonatomic, strong) MKMapView * mapView;
@property (nonatomic, strong) CLLocationManager * locationManager;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"导航"];
    self.view.backgroundColor = [UIColor cyanColor];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnPre)];
    
    _mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    [_mapView setShowsUserLocation:YES];
    [_mapView setDelegate:self];
    [self.view addSubview:_mapView];
    
    
    MKPointAnnotation *annotation =[[MKPointAnnotation alloc]init];
    annotation.coordinate = self.mapItem.placemark.location.coordinate;
    [annotation setTitle:self.mapItem.name];
    [_mapView addAnnotation:annotation];
    [_mapView setRegion:[_mapView regionThatFits:self.region] animated:YES];
    
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc]init];
        
        if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [_locationManager requestWhenInUseAuthorization];
        }
    }
    
    [self createLineFromCurrentToSite:[MKMapItem mapItemForCurrentLocation] to:self.mapItem];
}

- (void) createLineFromCurrentToSite:(MKMapItem *) fromItem to:(MKMapItem *) toItem{
    
    MKDirectionsRequest *request =[[MKDirectionsRequest alloc]init];
//    [request setRequestsAlternateRoutes:YES];
    [request setSource: fromItem];
    [request setDestination:toItem];
    
    MKDirections *directions = [[MKDirections alloc]initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(
                                            MKDirectionsResponse *response,
                                            NSError *error) {
        if (error || response.routes.count == 0) {
            NSLog(@"%@",error);
        }else{
            //NSLog(@"%@",response.routes);
            
            for (MKRoute *route in response.routes) {
                [_mapView addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
            }
        }
    }];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolylineRenderer *render = [[MKPolylineRenderer alloc]initWithPolyline:overlay];
        [render setLineWidth:1];
        [render setStrokeColor:[UIColor redColor]];
        return render;
    }else return nil;
}

- (void) returnPre{
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
