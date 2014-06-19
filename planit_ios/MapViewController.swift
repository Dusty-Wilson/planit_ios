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
    @IBOutlet var activityName: UILabel
    @IBOutlet var activityDescriptionName: UILabel
    @IBOutlet var activityTime: UILabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        println("++++++++++++++++++")
//        println(ActivityName.activity)
        var tripLocLat: CLLocationDegrees = ActivityName.activity["latitude"] as CLLocationDegrees
        var tripLocLong: CLLocationDegrees = ActivityName.activity["longitude"] as CLLocationDegrees
        var latDelta: CLLocationDegrees = 0.08
        var longDelta: CLLocationDegrees = 0.08
        var span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var activityLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(tripLocLat, tripLocLong)
        var region: MKCoordinateRegion = MKCoordinateRegionMake(activityLocation, span)
        self.mapView.setRegion(region, animated: true)
        
        var location = MKPointAnnotation()
        location.coordinate = activityLocation
        location.title = ActivityName.activity["name"] as String
        location.subtitle = ActivityName.activity["location"] as String
        activityName.text = ActivityName.activity["name"] as String
        activityDescriptionName.text = ActivityName.activity["description"] as String
        activityTime.text = ActivityName.activity["start_time"] as String
        self.mapView.addAnnotation(location)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
