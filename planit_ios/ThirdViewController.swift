import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogIn_Click(sender: UIButton){
        self.view.endEditing(true) //gets rid of keyboard
        println("Log In button click worked")
        println(txtEmail.text) // verifying that text field data is received
        
        // begin HTTP Post:
        var email = txtEmail.text
        var password = txtPassword.text
        
        var postString = NSString(format: "Email=\(email)&Password=\(password)")
        var postData = postString.dataUsingEncoding(NSUTF8StringEncoding)
        var url = NSURL(string: "http:0.0.0.0:3000/mobile_sessions/new")
        var request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.HTTPBody = postData
        request.setValue("text/xml", forHTTPHeaderField: "X-Requested-With")
        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        connection.start()
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
