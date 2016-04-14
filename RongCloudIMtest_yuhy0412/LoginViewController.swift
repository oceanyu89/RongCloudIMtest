//
//  LoginViewController.swift
//  RongCloudIMtest_yuhy0412
//
//  Created by ocean.yu on 16/4/13.
//  Copyright © 2016年 ocean.yu. All rights reserved.
//

import UIKit


extension UIView{
    @IBInspectable var cornerRadius: CGFloat{
        get{
            
            return self.layer.cornerRadius
            
        }
        set{
             self.layer.cornerRadius = newValue
            self.layer.masksToBounds = (newValue > 0)
        }
    }
}

class LoginViewController: UIViewController,JSAnimatedImagesViewDataSource {

    @IBOutlet weak var loginuser: UITextField!
    
    @IBOutlet weak var loginpassword: UITextField!
    
    @IBOutlet weak var wallpaperimageview: JSAnimatedImagesView!
    
    @IBAction func loginClick(sender: AnyObject) {
        
        let usertext = self.loginuser.text
        let passwordtext = self.loginpassword.text
        //第一种方法
        
        let loginuserquery = AVQuery(className: "oceanuser")
        let loginpasswordquery = AVQuery(className: "oceanuser")
        
        loginuserquery.whereKey("user", equalTo: usertext)
        loginpasswordquery.whereKey("pass", equalTo: passwordtext)
        

        let allquery = AVQuery.andQueryWithSubqueries([loginuserquery,loginpasswordquery])
        
        allquery.getFirstObjectInBackgroundWithBlock { (object, error) -> Void in
            if object == nil{
                self.errorNotice("登录信息不正确")
                //ShowCoversation
                
            }else
            {
                self.performSegueWithIdentifier("ShowCoversation", sender: self)
            }
            
        }
        //第二种方法
//        AVUser.logInWithUsernameInBackground(usertext, password: passwordtext) { (user, error) -> Void in
//            if user != nil{
//                
//                self.performSegueWithIdentifier("ShowCoversation", sender: self)
//                
//            }else
//            {
//                self.errorNotice("登录信息不正确")
//
//            }
//            
//        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        


        self.wallpaperimageview.dataSource = self
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        
    }
    
    func animatedImagesNumberOfImages(animatedImagesView: JSAnimatedImagesView!) -> UInt {
        return 3
    }
    func animatedImagesView(animatedImagesView: JSAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {
        
        return UIImage(named: "photo\(index + 1 )")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
