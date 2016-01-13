//
//  Book.swift
//  BookTracker
//
//  Created by 朱坤 on 16/1/3.
//  Copyright © 2016年 zhukun. All rights reserved.
//

import UIKit

class Book{
    
    var name :String
    var photo: UIImage?
    var rating :Int
    
    init?(name:String,photo:UIImage?,rating:Int){
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
  

}
