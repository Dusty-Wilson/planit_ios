import UIKit

var activityMgr: ActivityManager = ActivityManager()

struct activity{
    var name = "Un-Named"
    var desc = "Un-Described"
    
}

class ActivityManager: NSObject {
    
    var activities = activity[]()
    
    func    addActivity(name: String, desc: String){
        activities.append(activity(name: name, desc: desc))
    }
    
}
