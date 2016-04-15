//
//  LosePassTableViewController.swift
//  RongCloudIMtest_yuhy0412
//
//  Created by ocean.yu on 16/4/15.
//  Copyright © 2016年 ocean.yu. All rights reserved.
//

import UIKit

class LosePassTableViewController: UITableViewController {

    @IBOutlet weak var comebackquestion: UITextBox!
    
    @IBOutlet weak var comebackanswer: UITextBox!
    
    @IBOutlet weak var comebackpassword: UITextField!
    
    
    var cbuser : NSString = NSString()

    @IBAction func uploadclick(sender: AnyObject) {
        
        self.pleaseWait()
        let user = cbuser
        let question = comebackquestion.text
        let answer = comebackanswer.text
        
        
        let userquery = AVQuery(className: "oceanuser")
        let questionquery = AVQuery(className: "oceanuser")
        let answerquery = AVQuery(className: "oceanuser")
        
        userquery.whereKey("user", equalTo: user)
        questionquery.whereKey("question", equalTo: question)
        answerquery.whereKey("answer", equalTo: answer)
        
        let allquery = AVQuery.andQueryWithSubqueries([userquery,questionquery,answerquery])
        
        allquery.getFirstObjectInBackgroundWithBlock { (object, error) -> Void in
            
            self.clearAllNotice()
            if object != nil{
                //let arryobjec = object as? NSArray
                //print(object)
                self.successNotice("查询完成")
                let password = object.objectForKey("pass") as! String
//                print(password)
                self.comebackpassword.text = password
                
            }else
            {
                self.errorNotice("信息错误")
            }
            
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comebackquestion.becomeFirstResponder()
        
        self.navigationController?.navigationBarHidden = false
        
        self.title = "通过问题找回密码"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
/*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
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
