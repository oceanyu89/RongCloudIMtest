//
//  RegTableViewController.swift
//  RongCloudIMtest_yuhy0412
//
//  Created by ocean.yu on 16/4/13.
//  Copyright © 2016年 ocean.yu. All rights reserved.
//

import UIKit

class RegTableViewController: UITableViewController {

    
    @IBOutlet var requiredfieldcheck: [UITextField]!
    
    @IBOutlet weak var user: UITextField!

    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var region: UITextField!
    
    @IBOutlet weak var question: UITextField!
    
    @IBOutlet weak var answer: UITextField!
    
    func checkrequiredflied(){
        
        //此方法留作备用
        /*
        self.view.runBlockOnAllSubviews { (subviw) -> Void in
            if let subviw = subviw as? UITextField{
                if subviw.text!.isEmpty{
                    let alert = UIAlertController(title: "提示", message: "还有空余项没有填写", preferredStyle: UIAlertControllerStyle.Alert)
                    let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil)
                    alert.addAction(action)
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }
        }
        */
        for textfield in requiredfieldcheck{
            if textfield.text!.isEmpty{
                //使用第三方库来实现hub模式的提示
                /*
                let alert = UIAlertController(title: "提示", message: "还有必填项没有填写", preferredStyle: UIAlertControllerStyle.Alert)
                let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(action)
                self.presentViewController(alert, animated: true, completion: nil)
                */
                self.errorNotice("必填项不完整") // 引用的是swiftnotice
                
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationController?.navigationBarHidden = false
        self.title = "新用户注册"
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "checkrequiredflied")
    }
    
    func donebuttontap(){
        let alert = UIAlertController(title: "提示", message: "done完成", preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
//        UIAlertView(
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
