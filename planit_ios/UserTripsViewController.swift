import UIKit

class UserTripsViewController: UIViewController, NSURLConnectionDelegate, UITableViewDelegate {

    @lazy var data = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        startConnection()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startConnection(){
        let urlPath: String = "http://secure-taiga-5848.herokuapp.com/trips/1.json"
        var url: NSURL = NSURL(string: urlPath)
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        connection.start()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    
//        func btnLoad_Click(sender: UIButton){
//            startConnection()
//        }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var err: NSError
        // throwing an error on the line below (can't figure out where the error message is)
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        println(jsonResult)
    }
    
}
        
        

//        let emptyDictionary = [:]
//    var session = NSURLSession.sharedSession()
//        session.dataTaskWithRequest(url,
//            completionHandler: {(data: NSData!,
//                response: NSURLResponse!,
//                error: NSError!) in
//                println(data)
//                println(response)
//                println(error)
//            }).resume()
    
        
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */


