//
//  TripItem.swift
//  planit_ios
//
//  Created by Dusty Wilson on 6/16/14.
//  Copyright (c) 2014 Dusty Wilson. All rights reserved.
//

import UIKit

class TripItem: NSObject {
    
    var tripName: NSString = ""
    var tripDesc: NSString = ""
    var tripLoc: NSString = ""
    var tripStartDate: NSString = ""
    var tripEndDate: NSString = ""
    var tripCreatorId: NSString = ""
    var creationDate: NSDate = NSDate()
    
    init(name:String){
        self.tripName = name
        
    }
}



