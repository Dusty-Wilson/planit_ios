
//
//  UserTripsTableViewController.swift
//  planit_ios
//
//  Created by Dusty Wilson on 6/16/14.
//  Copyright (c) 2014 Dusty Wilson. All rights reserved.
//

import UIKit

class UserTripsTableViewController: UITableViewController {
    
    var data = NSMutableData()
    var tripItems: NSMutableArray = []
    var hardCodedId = 9 //////////////////////////////////////////////////

    override func viewDidLoad() {
        super.viewDidLoad()
        println("Trip Table View Load")
        println("struct value in Table View class:")
        println(UserId.id)
        getFromWeb()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getFromWeb(){
        println("function started to get user trips from web app")
        let urlPath: String = "http://localhost:3000/mobile_trips/user_trips?user_id=\(hardCodedId)"///////////////////////////////
        
        func getJSON(urlToRequest: String) -> NSData{
            return NSData(contentsOfURL: NSURL(string:urlToRequest))
        }
        
        func parseJSON(inputData: NSData) -> NSMutableArray{
            var error: NSError?
            var boardsDictionary: NSMutableArray = NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSMutableArray
            return boardsDictionary
        }
        
        var rawJSON = getJSON(urlPath)
        var parsedJSON = parseJSON(rawJSON)
        println(parsedJSON)
        
        for jsonObject in parsedJSON {
            var thisObj = jsonObject as NSDictionary
            var tripName = thisObj["name"] as String
            var newTrip = TripItem(name: tripName) // is this creating a trip object? If so, can I use that in other controllers?
            self.tripItems.addObject(newTrip)
            println("array of trip items gotten from web:")
            println(tripItems)
            }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.tripItems.count
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let CellIndentifier: NSString = "ListPrototypeCell"
        var cell : UITableViewCell=tableView.dequeueReusableCellWithIdentifier(CellIndentifier) as UITableViewCell
        var tripitem: TripItem = self.tripItems.objectAtIndex(indexPath.row) as TripItem
        cell.textLabel.text = tripitem.tripName
        return cell
        
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        var rowData = self.tripItems[indexPath.row] as TripItem
        TripName.name = rowData.tripName
    }
}
