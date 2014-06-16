import UIKit

class UserTripsViewController: UIViewController, NSURLConnectionDelegate, UITableViewDelegate {
    @IBOutlet var tableLabel: UILabel
//    @IBOutlet var appsTableView : UITableView
    
    var data = NSMutableData()
    var tableData: NSArray = NSArray()
    
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
        let urlPath: String = "http:0.0.0.0:3000/trips/1.json"
        var url: NSURL = NSURL(string: urlPath)
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        connection.start()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var err: NSError
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        println(jsonResult)
        println(data)
    }
    
//    These below functions create a get request to trips/1.json in our first attepmt
//    to display a json object in a table view.
//    func startConnection(){
//        let urlPath: String = "http://secure-taiga-5848.herokuapp.com/trips/1.json"
//        var url: NSURL = NSURL(string: urlPath)
//        var request: NSURLRequest = NSURLRequest(URL: url)
//        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)
//        connection.start()
//    }
//    
//    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
//        self.data.appendData(data)
//    }
//    
//    func connectionDidFinishLoading(connection: NSURLConnection!) {
//        var err: NSError
//        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
//        println(jsonResult)
//        println(jsonResult["name"])
//        tableLabel.text = jsonResult["name"] as String
//    }
    
    
}



