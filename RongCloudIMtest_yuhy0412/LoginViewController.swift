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

    
    
    @IBOutlet weak var wallpaperimageview: JSAnimatedImagesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        


        self.wallpaperimageview.dataSource = self
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
