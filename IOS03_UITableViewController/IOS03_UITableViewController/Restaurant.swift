//
//  Restaurant.swift
//  IOS03_UITableViewController
//
//  Created by 蘇怡璇 on 2016/4/12.
//  Copyright © 2016年 Su Justin. All rights reserved.
//

import UIKit

class Restaurant {
    
    var name:String?, type:String?, location:String?, image:UIImage?, isVisited:Bool = false;
    
    init(){
        
    }
    
    init(name:String, type:String, location:String, image:UIImage, isVisited:Bool){
        self.name = name;
        self.type = type;
        self.location = location;
        self.image = image;
        self.isVisited = isVisited;
    }
}
