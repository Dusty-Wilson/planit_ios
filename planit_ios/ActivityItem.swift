//
//  TripItem.swift
//  planit_ios
//
//  Created by Dusty Wilson on 6/16/14.
//  Copyright (c) 2014 Dusty Wilson. All rights reserved.
//

import UIKit

class ActivityItem: NSObject {
    
    var activityName: NSString = ""
    var activityDesc: NSString = ""
    var activityLoc: NSString = ""
    var activityLat = 0
    var activityLong = 0
    var activityStartDate: NSString = ""
    var activityEndDate: NSString = ""
    var activityCreatorId: NSString = ""
    var activityCreationDate: NSDate = NSDate()
    
    init(name:String){
        self.activityName = name
         
    }
}
