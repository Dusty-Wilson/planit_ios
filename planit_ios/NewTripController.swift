import UIKit

class NewTripViewController: UIViewController, UITextFieldDelegate {
   
    @IBOutlet var txtTripName: UITextField!
    @IBOutlet var txtTripDesc: UITextField!
    @IBOutlet var txtTripLoc: UITextField!
    @IBOutlet var txtStartDate: UITextField!
    @IBOutlet var txtEndDate: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCreateTrip_Click(sender: UIButton){
        self.view.endEditing(true) //gets rid of keyboard
        println("Create Trip button click worked")

        // begin HTTP Post:
        var name = txtTripName.text
        var description = txtTripDesc.text
        var location = txtTripLoc.text
        var start_date = txtStartDate.text
        var end_date = txtEndDate.text
        var creator_id = 13    //*************this is where we need to have the user_id stored locally on phone
        
        var postString = NSString(format: "name=\(name)&description=\(description)&location=\(location)&start_date=\(start_date)&end_date=\(end_date)&creator_id=\(creator_id)}")
        var postData = postString.dataUsingEncoding(NSUTF8StringEncoding)
        var url = NSURL(string: "http:0.0.0.0:3000/mobile_trips/new")
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
