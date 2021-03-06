import UIKit

class ThirdViewController: UIViewController, NSURLConnectionDelegate {

    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    var data = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnLogIn_Click(sender: UIButton){
        println("Log In button clicked")
        postToWeb()
    }
    
    func postToWeb(){
        println("function started to post email to web app")
        self.view.endEditing(true) //gets rid of keyboard
        println("email sent to web app:")
        println(txtEmail.text)
        var email = txtEmail.text
        var password = txtPassword.text
        var postString = NSString(format: "Email=\(email)&Password=\(password)")
        var postData = postString.dataUsingEncoding(NSUTF8StringEncoding)
        var urlPost = NSURL(string: "http:0.0.0.0:3000/mobile_sessions/sign_in")
        var request = NSMutableURLRequest(URL: urlPost)
        request.HTTPMethod = "POST"
        request.HTTPBody = postData
        request.setValue("text/xml", forHTTPHeaderField: "X-Requested-With")
        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        connection.start()

    }
    
//    func getFromWeb(){
//        println("function started to get user ID from web app")
//        let urlPath: String = "http://0.0.0.0:3000/mobile_sessions/sign_in"
//        var url: NSURL = NSURL(string: urlPath)
//        var request: NSURLRequest = NSURLRequest(URL: url)
//        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)
//        connection.start()
//    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        println("received data from server")
        var err: NSError
        // throwing an error on the line below (can't figure out where the error message is)
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        var userId : AnyObject! = jsonResult["id"]
        println("user id gotten from web app:")
        println(userId)
        println("user id variable type:")
        println("\(object_getClassName(userId))")
        UserId.id = userId
        println("struct after user id has been assigned to it:")
        println(UserId.id)
        
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        UserTripsTableViewController.id = Int(userId)
//        self.presentViewController(UserTripsTableViewController, animated:true, completion:nil)
    }
}



