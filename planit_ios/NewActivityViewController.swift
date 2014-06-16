//
//  NewActivityViewController.swift
//  planit_ios
//
//  Created by Dusty Wilson on 6/16/14.
//  Copyright (c) 2014 Dusty Wilson. All rights reserved.
//

import UIKit

class NewActivityViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtDesc: UITextField!
    @IBOutlet var txtLocation: UITextField!
    @IBOutlet var txtStartTime: UITextField!
    @IBOutlet var txtEndTime: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCreateActivity_Click(sender: UIButton){
        self.view.endEditing(true) //gets rid of keyboard
        println("Create Trip button click worked")
        
        // begin HTTP Post:
        var name = txtName.text
        var description = txtDesc.text
        var location = txtLocation.text
        var start_time = txtStartTime.text
        var end_time = txtEndTime.text
        var trip_id = 3        //*************this is where we need to have the trip_id dynamically updated based on view
        var creator_id = 13    //*************this is where we need to have the user_id stored locally on phone
        
        var postString = NSString(format: "name=\(name)&description=\(description)&location=\(location)&start_date=\(start_time)&end_date=\(end_time)&trip_id=\(trip_id)&creator_id=\(creator_id)}")
        var postData = postString.dataUsingEncoding(NSUTF8StringEncoding)
        var url = NSURL(string: "http:0.0.0.0:3000/mobile_activities/new")
        var request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.HTTPBody = postData
        request.setValue("text/xml", forHTTPHeaderField: "X-Requested-With")
        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        connection.start()
    }
    
    // iOS Touch Functions
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    
    // UI Textfield Delegate
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder();
        return true
    }
}
