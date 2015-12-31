//
//  MyAnnotation.swift
//  SwiftMap
//
//  Created by Bor on 15/12/23.
//  Copyright © 2015年 bor. All rights reserved.
//

import UIKit
import MapKit
class MyAnnotation: NSObject, MKAnnotation {
    var coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
    var title:String!
    init(coordinate:CLLocationCoordinate2D,title:String){
        self.coordinate = coordinate
        self.title = title
    }
}
