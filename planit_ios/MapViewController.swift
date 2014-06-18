//
//  MapViewController.swift
//  planit_ios
//
//  Created by Dusty Wilson on 6/16/14.
//  Copyright (c) 2014 Dusty Wilson. All rights reserved.
//

import UIKit
import MapKit
import Foundation
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {
    
    @IBOutlet var mapView: MKMapView
    
    //    var data = NSMutableData()
//    @IBOutlet var activitiesTableView: UITableView
    
//    var tripActivities: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var tripLocLat: CLLocationDegrees = 48.399193
        var tripLocLong: CLLocationDegrees = 9.993341
        var latDelta: CLLocationDegrees = 0.01
        var longDelta: CLLocationDegrees = 0.01
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var userLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(tripLocLat, tripLocLong)
        var region: MKCoordinateRegion = MKCoordinateRegionMake(userLocation, span)
        self.mapView.setRegion(region, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    func getFromWeb(){
//        println("function started to get trip activities from web app")
//        println("Trip Name sent to web app:")
//        println(TripName.name)
//        var postString = NSString(format: "trip_name=\(TripName.name)")
//        var postData = postString.dataUsingEncoding(NSUTF8StringEncoding)
//        var urlPost = NSURL(string: "http:0.0.0.0:3000/'mobile_trips/activities_detail'")
//        var request = NSMutableURLRequest(URL: urlPost)
//        request.HTTPMethod = "POST"
//        request.HTTPBody = postData
//        request.setValue("text/xml", forHTTPHeaderField: "X-Requested-With")
//        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
//        connection.start()
//        
//    }
//    
//    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
//        self.data.appendData(data)
//    }
//    
//    func connectionDidFinishLoading(connection: NSURLConnection!) {
//        println("received data from server")
//        var err: NSError
//        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
//        println("+++++++++++++++++++")
//        println(jsonResult)
////        for each in jsonResult {
////            self.tripActivities.addObject(each["first_name"])
////        }
//        self.activitiesTableView.reloadData()
//    }
    
//    func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
//        return 1
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.tripActivities.count
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
//        let cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "ActivityCell")
////        var rowData = self.tripTravelers.objectAtIndex(indexPath.row)
////        cell.text = rowData as String
//        return cell
//        
//    }

}
