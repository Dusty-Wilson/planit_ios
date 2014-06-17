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
    var hardCodedId = 13

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
        let urlPath: String = "http://localhost:3000/mobile_trips/user_trips?user_id=\(UserId.id)"
        
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
        let btnDetail = UIButton()
        var cell : UITableViewCell=tableView.dequeueReusableCellWithIdentifier(CellIndentifier) as UITableViewCell
        var tripitem: TripItem = self.tripItems.objectAtIndex(indexPath.row) as TripItem
        cell.textLabel.text = tripitem.tripName
        return cell
        self.view.addSubview(btnDetail)
        btnDetail.tag = indexPath.row;
    }
    
    @IBAction func btnDetail_Click(sender: UIButton){
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView?, moveRowAtIndexPath fromIndexPath: NSIndexPath?, toIndexPath: NSIndexPath?) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView?, canMoveRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
