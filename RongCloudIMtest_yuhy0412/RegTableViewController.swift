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
    
    @IBOutlet weak var user: UITextBox!

    @IBOutlet weak var password: UITextBox!
    
    @IBOutlet weak var email: UITextBox!
    
    @IBOutlet weak var region: UITextBox!
    
    @IBOutlet weak var question: UITextBox!
    
    @IBOutlet weak var answer: UITextBox!
    
    
    var possibleInputs : InputsCheck = []
    
    
    
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
        
        let regex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES &@", regex)
        guard predicate .evaluateWithObject(email.text) else{
            self.errorNotice("邮箱格式不正确")
            return
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
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "checkrequiredflied")
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "donebuttontap")
        
        
        self.navigationItem.rightBarButtonItem?.enabled = false
        /*
        实现按钮有效性，可以使用原始方法，定义元组var(userok,passwordok,emailok) = (false,false,false)
        在每一个输入框判断，如果有效，给true值，否则给false，然后给出判断rightButton?.enable = userok && passwordok && emailok
        这样的操作要做3次，如果必填输入框有很多，这个方法就会显得冗余。
        下面使用另一个方法进行优化Optionset
        */
        
        let rightButton = self.navigationItem.rightBarButtonItem
        
        let v1 = AJWValidator(type: AJWValidatorType.String)
        v1.addValidationToEnsureMinimumLength(3, invalidMessage: "不能少于3位")
        v1.addValidationToEnsureMaximumLength(13, invalidMessage: "不能多于13位")
        self.user.ajw_attachValidator(v1)//附加一个validator
        v1.validatorStateChangedHandler = { (newState : AJWValidatorState) -> Void in
            
            switch newState {
            case AJWValidatorState.ValidationStateValid:
                self.user.highlightState = UITextBoxHighlightState.Default
                self.possibleInputs.unionInPlace(InputsCheck.user)
               
            default:
                let errrorMsg = v1.errorMessages.first as?String
                self.user.highlightState = UITextBoxHighlightState.Wrong(errrorMsg!)
                self.possibleInputs.subtractInPlace(InputsCheck.user)
            }
            rightButton?.enabled = self.possibleInputs.isAllOK()
        
        }
        
        let v2 = AJWValidator(type: AJWValidatorType.String)
        v2.addValidationToEnsureMinimumLength(3, invalidMessage: "不能少于3位")
        v2.addValidationToEnsureMaximumLength(13, invalidMessage: "不能多于13位")
        self.password.ajw_attachValidator(v2)
        
        v2.validatorStateChangedHandler = {
            (newState:AJWValidatorState)-> Void in
            switch newState{
                case AJWValidatorState.ValidationStateValid:
                    self.password.highlightState = UITextBoxHighlightState.Default
                    self.possibleInputs.unionInPlace(InputsCheck.password)
                default:
                    let errrorMsg = v2.errorMessages.first as?String
                    self.password.highlightState = UITextBoxHighlightState.Wrong(errrorMsg!)
                    self.possibleInputs.subtractInPlace(InputsCheck.password)
            }
            rightButton?.enabled = self.possibleInputs.isAllOK()
        }
        
        
        
        let v3 = AJWValidator(type: AJWValidatorType.String)
        v3.addValidationToEnsureValidEmailWithInvalidMessage("mail信息不对")

        self.email.ajw_attachValidator(v3)
        
        v3.validatorStateChangedHandler = {
            (newState:AJWValidatorState)-> Void in
            switch newState{
            case AJWValidatorState.ValidationStateValid:
                self.email.highlightState = UITextBoxHighlightState.Default
                self.possibleInputs.unionInPlace(InputsCheck.email)
            default:
                let errrorMsg = v3.errorMessages.first as?String
                self.email.highlightState = UITextBoxHighlightState.Wrong(errrorMsg!)
                self.possibleInputs.subtractInPlace(InputsCheck.email)
            }
            rightButton?.enabled = self.possibleInputs.isAllOK()
            
        }
        
        
        
    }
    
    func donebuttontap(){
        
        
//        let alert = UIAlertController(title: "提示", message: "done完成", preferredStyle: UIAlertControllerStyle.Alert)
//        let action = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil)
//        alert.addAction(action)
//        self.presentViewController(alert, animated: true, completion: nil)
            //注册新用户 leancloud 
        //菊花等待
        self.pleaseWait()
        
        //建立用户 AVObject oceanuser
        let user = AVObject(className: "oceanuser")
        
        //保存对象到云端
        user["user"] = self.user.text
        user["pass"] = self.password.text
        user["mail"] = self.email.text
        user["region"] = self.region.text
        user["question"] = self.question.text
        user["answer"] = self.answer.text
        
        //查询用户名是否已经被注册过了
        let query = AVQuery(className: "oceanuser")
        query.whereKey("user", equalTo: self.user.text)
        //执行查询
        
        query.getFirstObjectInBackgroundWithBlock { (object, e) -> Void in
            
            self.clearAllNotice()
            
            if object != nil{
                
                self.errorNotice("用户注册过了")
                self.becomeFirstResponder()
            }else{
                
                //用户注册
                user.saveInBackgroundWithBlock({ (sucess, error) -> Void in
                    if sucess {
                        self.successNotice("注册成功")
                        self.navigationController?.popViewControllerAnimated(true)
                    }else{
                        self.errorNotice("注册失败")
                    }
                    
                })
            }
            
        }
        
        
        
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
