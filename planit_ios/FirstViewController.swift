import UIKit
import QuartzCore

class FirstViewController: UIViewController {
    
    @IBOutlet var currentActivity :UILabel
    @IBOutlet var firstActionImage :UIImageView
    @IBOutlet var secondActionImage :UIImageView
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstActionImage.layer.cornerRadius = 10.0
        firstActionImage.clipsToBounds = true;
        secondActionImage.layer.cornerRadius = 10.0
        secondActionImage.clipsToBounds = true;
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    // Returning to view
//    override func viewWillAppear(animated: Bool) {
//        tblActivities.reloadData();
//    }
    
    // UI tableView datasource
//    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
//        return activityMgr.activities.count
//    }
    
//    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
//        
//        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "test")
//        cell.text = activityMgr.activities[indexPath.row].name
//        cell.detailTextLabel.text = activityMgr.activities[indexPath.row].desc
//        
//        return cell
//    }
    
    @IBAction func phone(){
        currentActivity.text = "Test Activity"
    }
    
    
    
    
}