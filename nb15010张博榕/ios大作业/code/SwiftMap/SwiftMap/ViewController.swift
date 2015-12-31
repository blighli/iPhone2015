import UIKit
import MapKit
class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var btnHotel: UIButton!
    @IBOutlet weak var btnHospital: UIButton!
    @IBOutlet weak var btnSM: UIButton!

    @IBOutlet weak var btnMenu: UIButton!
    @IBAction func btnHotelClick(sender: AnyObject) {
        mapView.removeAnnotations(mapView.annotations)
        searchMap("hotel")
        reset()
    }
    @IBAction func btnHospitalClick(sender: AnyObject) {
        mapView.removeAnnotations(mapView.annotations)
        searchMap("hospital")
        reset()
    }
    @IBAction func btnSMClick(sender: AnyObject) {
        mapView.removeAnnotations(mapView.annotations)
        searchMap("supermarket")
        reset()
    }
    
    //初始化位置
    let intialLocation = CLLocation(latitude: 29.8963640000, longitude: 121.6455050000)
    //设置所搜范围
    let searchRadius:CLLocationDistance = 15000
    @IBAction func btnMenuClick(sender: AnyObject) {
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {()->Void in
            self.btnMenu.transform = CGAffineTransformMakeRotation(0)
            //对三个按钮设置
            self.btnHotel.alpha = 0.8
            self.btnHotel.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.5, 1.5), CGAffineTransformMakeTranslation(-80, -25))
            self.btnHospital.alpha = 0.8
            self.btnHospital.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.5, 1.5), CGAffineTransformMakeTranslation(0, -50))
            self.btnSM.alpha = 0.8
            self.btnSM.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.5, 1.5), CGAffineTransformMakeTranslation(80, -25))
        }, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnMenu.alpha = 0
        //对三个按钮设置
        self.btnHotel.alpha = 0
        self.btnHospital.alpha = 0
        self.btnSM.alpha = 0
        self.btnHotel.layer.cornerRadius = 10
        self.btnHospital.layer.cornerRadius = 10
        self.btnSM.layer.cornerRadius = 10
        UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.CurveEaseInOut, animations: {()->Void in
            self.btnMenu.alpha = 1
            self.btnMenu.transform = CGAffineTransformMakeRotation(0.25*3.1415927)
        }, completion: nil)
        
        //创建一个区域
        let region = MKCoordinateRegionMakeWithDistance(intialLocation.coordinate, searchRadius, searchRadius)
        //设置显示
        mapView.setRegion(region, animated: true)
        searchMap("place")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func reset(){
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {()->Void in
            self.btnMenu.transform = CGAffineTransformMakeRotation(0.25*3.1415927)
            //对三个按钮设置
            self.btnHotel.alpha = 0
            self.btnHotel.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1, 1), CGAffineTransformMakeTranslation(0, 0))
            self.btnHospital.alpha = 0
            self.btnHospital.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1, 1), CGAffineTransformMakeTranslation(0, 0))
            self.btnSM.alpha = 0
            self.btnSM.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1, 1), CGAffineTransformMakeTranslation(0, 0))
            }, completion: nil)

    }
    
    //增加兴趣地点
    func addLocation(title:String, latitude:CLLocationDegrees, longtitude:CLLocationDegrees){
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        let annotation = MyAnnotation(coordinate: location, title: title)
        mapView.addAnnotation(annotation)
    }
    
    //搜索
    func searchMap(place:String){
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = place
        //搜索当前区域
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        request.region = MKCoordinateRegion(center:intialLocation.coordinate, span: span)
        //启动搜索,并且把返回结果保存在数组中
        let search = MKLocalSearch(request: request)
        search.startWithCompletionHandler{(response:MKLocalSearchResponse?, error:NSError?) -> Void in
            for item in response!.mapItems{
                self.addLocation(item.name!, latitude: (item.placemark.location?.coordinate.latitude)!, longtitude:(item.placemark.location?.coordinate.longitude)!)
            }
        }
    }

}

