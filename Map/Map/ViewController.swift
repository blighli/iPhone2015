//
//  ViewController.swift
//  Map
//
//  Created by wanghaobo on 16/1/5.
//  Copyright © 2016年 wanghaobo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,MKMapViewDelegate{

    var startField:UITextField!
    var deretField:UITextField!
    var mapView:MKMapView!
    var navBtn:UIButton!
    var ge:CLGeocoder!
    let mainH = UIScreen.mainScreen().bounds.size.height
    let mainW = UIScreen.mainScreen().bounds.size.width
    var startLocation:CLLocation!
    var deretLocation:CLLocation!
    var navPath:MKPolyline!
    var startMark:CLPlacemark!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMapView()
        self.initSubViews()
        
    }
    func loadMapView()
    {
        mapView = MKMapView(frame: self.view.bounds)
        mapView.mapType = MKMapType.Standard
        mapView.zoomEnabled = true
        mapView.scrollEnabled = true
        mapView.rotateEnabled = true
        mapView.delegate = self
        self.view.addSubview(mapView)
        self.locateToLatitudeAndLongitude(31.231706, longitude: 121.472644)
    }
    func locateToLatitudeAndLongitude(latitude:Double,longitude:Double)
    {
        let coor:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude,longitude)
        let sp:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)//设置精确范围
        let range:MKCoordinateRegion = MKCoordinateRegionMake(coor, sp)//经纬度+精确度 结构体
        mapView.setRegion(range, animated: true)
    }
    func initSubViews()
    {
        startField = UITextField(frame: CGRectMake((mainW - 175)/2,40,175,25))
        deretField = UITextField(frame: CGRectMake((mainW - 175)/2,70,175,25))
        startField.borderStyle = UITextBorderStyle.RoundedRect
        deretField.borderStyle = UITextBorderStyle.RoundedRect
        startField.placeholder = "出发点"
        deretField.placeholder = "目的地"
        self.view .addSubview(startField)
        self.view .addSubview(deretField)
        
        //导航按钮
        navBtn = UIButton(frame:CGRectMake(startField.frame.origin.x + startField.frame.size.width + 10 ,55 ,60, 20))
        navBtn.layer.borderWidth = 0.5
        navBtn.layer.borderColor = UIColor.blackColor().CGColor
        navBtn.layer.cornerRadius = 4.0
        navBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        navBtn.titleLabel?.font = UIFont.systemFontOfSize(13)
        navBtn.setTitle("开始导航", forState:UIControlState.Normal)
        navBtn.addTarget(self, action: "startNav", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(navBtn)
    }
    func startNav()
    {
        startField.resignFirstResponder()
        deretField.resignFirstResponder()
        if startField.text == nil || deretField.text == nil || startField.text == "" || deretField.text == ""
            
        {
            
            let aler:UIAlertView = UIAlertView(title: "提示", message: "出发地或者目的地无效", delegate: nil, cancelButtonTitle: "ok")
            
            aler.show()
            return
        }

        self.codeToString(self.startField.text!)
    }
    func codeToString(address:NSString)
    {
        ge = CLGeocoder()
        ge.geocodeAddressString(address as String){ ( placemarks:[CLPlacemark]?, error:NSError?) -> Void in
            if placemarks?.count > 0
            {
                let pl:CLPlacemark = placemarks![0] 
                if address == self.startField.text
                {
                    self.startLocation = pl.location
                    let an:MKPointAnnotation = MKPointAnnotation()
                    an.coordinate = (pl.location?.coordinate)!
                    an.title = "出发点"
                    self.startMark = pl
                    self.mapView.addAnnotation(an)
                    print("精度:\(pl.location?.coordinate.longitude);维度\(pl.location?.coordinate.latitude)")
                    self.locateToLatitudeAndLongitude((pl.location?.coordinate.latitude)!, longitude: (pl.location?.coordinate.longitude)!)
                    self.codeToString(self.deretField.text!)
                }else{
                    
                    self.deretLocation = pl.location
                    let an:MKPointAnnotation = MKPointAnnotation()
                    an.coordinate = (pl.location?.coordinate)!
                    an.title = "目的地"
                    self.mapView.addAnnotation(an)
                    print("精度:\(pl.location?.coordinate.longitude);维度\(pl.location?.coordinate.latitude)")
                    
                    self.startNavigation(pl)
                    
                }
            }
        }
        
    }
    func startNavigation(mark:CLPlacemark)
    {
        
        let request:MKDirectionsRequest = MKDirectionsRequest()
        request.source = self.getAItemWithMark(startMark)//设置出发点
        request.destination = self.getAItemWithMark(mark)//设置目的地
        
        let mkdirection:MKDirections = MKDirections(request:request)
        mkdirection.calculateDirectionsWithCompletionHandler{(response:MKDirectionsResponse?,err:NSError?)-> Void in
            
            //查询返回的第一条路线
            let route:MKRoute = (response?.routes[0])! as MKRoute
            print(route)
            
            //保存路线
            self.navPath = route.polyline
            self.mapView.addOverlay(self.navPath, level: MKOverlayLevel.AboveLabels)
        }
        if self.navPath != nil {
            mapView.removeOverlay(self.navPath)

        }
    }
    func getAItemWithMark(mark:CLPlacemark) -> MKMapItem
    {
        let mkp:MKPlacemark = MKPlacemark(placemark: mark)
        let item:MKMapItem = MKMapItem(placemark:mkp)
        return item
    }
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer
    {
        
        //创建一个render
        let naRende:MKPolylineRenderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        
        naRende.strokeColor = UIColor.redColor()
        naRende.lineWidth = 5.0
        
        return naRende
        
    }
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView?
    {
        let identy:NSString = "identy"
        
        var pinView:MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identy as String) as? MKPinAnnotationView
        if  nil == pinView
        {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identy as String)
        }
        if  annotation.title! == "出发点"
        {
            pinView?.pinColor = MKPinAnnotationColor.Green
        }
        else
        {
            pinView?.pinColor = MKPinAnnotationColor.Red
        }
        return pinView
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

