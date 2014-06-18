
//  TripActivitiesTableViewController.swift
//  planit_ios
//
//  Created by Dusty Wilson on 6/18/14.
//  Copyright (c) 2014 Dusty Wilson. All rights reserved.
//

import UIKit

class TripActivitiesTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var data = NSMutableData()
    var tripActivities: NSMutableArray = []
    var persistingActivities: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postToWeb()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func postToWeb(){
        var postString = NSString(format: "trip_name=\(TripName.name)")
        var postData = postString.dataUsingEncoding(NSUTF8StringEncoding)
        var urlPost = NSURL(string: "http:0.0.0.0:3000/mobile_trips/activities_detail")
        var request = NSMutableURLRequest(URL: urlPost)
        request.HTTPMethod = "POST"
        request.HTTPBody = postData
        request.setValue("text/xml", forHTTPHeaderField: "X-Requested-With")
        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        connection.start()
        
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var err: NSError
        var jsonResult: NSArray = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSArray
//        println("++++++++++++++++++")
        //        println(jsonResult)
        for each in jsonResult {
            self.persistingActivities.addObject(each)
            self.tripActivities.addObject(each["name"])
        }
        self.tableView.reloadData()
        //        println(tripActivities)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.tripActivities.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let CellIndentifier: NSString = "ListPrototypeCell"
        var cell : UITableViewCell=tableView.dequeueReusableCellWithIdentifier(CellIndentifier) as UITableViewCell
        var tripActivity = self.tripActivities.objectAtIndex(indexPath.row) as String
        cell.textLabel.text = tripActivity
//        println("add text to cell")
        return cell
        
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        ActivityName.activity = self.persistingActivities[indexPath.row] as NSDictionary
    }
}
