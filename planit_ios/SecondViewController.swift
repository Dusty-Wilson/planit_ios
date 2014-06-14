import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var txtActivity: UITextField!
    @IBOutlet var txtDesc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Events
    //Could be named anything. after this, you have to right click the item
    //and create a connection to the controller. 
    //When you right click and drag to the controller, you're give the optional
    //tasks within that class. 
    //all things within this function happen on the buton click
    @IBAction func btnAddActivity_Click(sender: UIButton){
        activityMgr.addActivity(txtActivity.text, desc: txtDesc.text)
        self.view.endEditing(true) //gets rid of keyboard
        txtActivity.text = ""
        txtDesc.text = ""
        self.tabBarController.selectedIndex = 0;
        
        //begin HTTP Post:
        var activityTitle = "Hard coded title"
        var activityDesc = "hard coded description"
        var postString = NSString(format: "Title=\(activityTitle)&Desc=\(activityDesc)")
        var postData = postString.dataUsingEncoding(NSUTF8StringEncoding)
        var url = NSURL(string: "http://secure-taiga-5848.herokuapp.com/users")
        var request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
            //        var requestBodyData: NSData = dataString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) as NSData
        request.HTTPBody = postData
        request.setValue("text/xml", forHTTPHeaderField: "X-Requested-With")
        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
//        NSlog("sending request...", request)
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
