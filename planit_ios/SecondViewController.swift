import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var txtFName: UITextField!
    @IBOutlet var txtLName: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPhone: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtPasswordConfirm: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCreateAccount_Click(sender: UIButton){
        self.view.endEditing(true) //gets rid of keyboard
        println("Sign Up button click worked")
        println(txtFName.text) // verifying that text field data is received 
        
        // begin HTTP Post:
        var fName = txtFName.text
        var lName = txtLName.text
        var email = txtEmail.text
        var phone = txtPhone.text
        var password = txtPassword.text
        
        var postString = NSString(format: "FName=\(fName)&LName=\(lName)&email=\(email)&phone=\(phone)&pword=\(password)")
        var postData = postString.dataUsingEncoding(NSUTF8StringEncoding)
        var url = NSURL(string: "http:0.0.0.0:3000/mobile_users/new")
        var request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
            //        var requestBodyData: NSData = dataString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) as NSData
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
