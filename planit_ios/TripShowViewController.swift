//
//  TripShowViewController.swift
//  planit_ios
//
//  Created by Dusty Wilson on 6/16/14.
//  Copyright (c) 2014 Dusty Wilson. All rights reserved.
//

import UIKit

class TripShowViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tripNameHeader: UILabel
    @IBOutlet var locationHeader: UILabel
    @IBOutlet var startDateHeader: UILabel
    @IBOutlet var travelersTableView: UITableView

    var data = NSMutableData()
    var tripDetails: NSMutableArray = []
    var tripTravelers: NSMutableArray = []
//    var tripActivities: NSMutableArray = []
    var currentTrip: NSMutableDictionary = [:]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tripNameHeader.text = TripName.name!
//        println("trip show view load")
//        println("should reflect trip show name++++++++++++++++")
//        println(TripName.name)
        getFromWeb()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getFromWeb(){
        println("function started to get trip details from web app")
        println("Trip Name sent to web app:")
        println(TripName.name)
        var postString = NSString(format: "trip_name=\(TripName.name)")
        var postData = postString.dataUsingEncoding(NSUTF8StringEncoding)
        var urlPost = NSURL(string: "http:0.0.0.0:3000/mobile_trips/trip_detail")
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
        println("received data from server")
        var err: NSError
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary

        var jsonTravelers: NSMutableArray = jsonResult["travelers"] as NSMutableArray
//        println(jsonTravelers)
        currentTrip = jsonResult["trip"] as NSMutableDictionary
        for each in jsonTravelers {
            self.tripTravelers.addObject(each["first_name"])
        }
        self.travelersTableView.reloadData()
        locationHeader.text = currentTrip["location"] as? String
        startDateHeader.text = currentTrip["start_date"] as? String
    }


    
    
    
    func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.tripTravelers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "TravelerCell")
        var rowData = self.tripTravelers.objectAtIndex(indexPath.row)
        cell.text = rowData as String
        return cell
        
    }
    
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
