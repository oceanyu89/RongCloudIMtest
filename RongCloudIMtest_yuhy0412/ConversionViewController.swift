//
//  ConversionViewController.swift
//  RongCloudIMtest_yuhy0412
//
//  Created by ocean.yu on 16/4/12.
//  Copyright © 2016年 ocean.yu. All rights reserved.
//

import UIKit

class ConversionViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        

//        self.targetId = RCIMClient.sharedRCIMClient().currentUserInfo.userId
//
//        self.conversationType = RCConversationType.ConversationType_PRIVATE
//        self.title = RCIMClient.sharedRCIMClient().currentUserInfo.name
//        
        self.targetId = "oceanyu"
        self.title = "海洋"
        
        self.conversationType = RCConversationType.ConversationType_PRIVATE
        self.setMessageAvatarStyle(RCUserAvatarStyle.USER_AVATAR_CYCLE)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
