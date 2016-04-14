//
//  ConversitionlistViewController.swift
//  RongCloudIMtest_yuhy0412
//
//  Created by ocean.yu on 16/4/12.
//  Copyright © 2016年 ocean.yu. All rights reserved.
//

import UIKit

class ConversitionlistViewController: RCConversationListViewController {

    @IBAction func ShowMenu(sender: AnyObject) {
        var frame = sender.valueForKey("view")?.frame
        frame?.origin.y = (frame?.origin.y)! + 30
        
        
    KxMenu.showMenuInView(self.view, fromRect: frame!, menuItems:
        [
            KxMenuItem ("返回对话",image:nil,target:self,action:"ClickMenu1"),
            KxMenuItem ("通讯录",image:nil,target:self,action:"ClickMenu2"),
            KxMenuItem ("客服",image:nil,target:self,action:"ClickMenu3")
            
            
        ]
        
        )
        
        
    }
    
    func ClickMenu1(){
        self.tabBarController?.tabBar.hidden = true
        
        //打开会话界面
        let chat = RCConversationViewController(conversationType:RCConversationType.ConversationType_PRIVATE, targetId: "oceanyu")
        
        //let userInfo = RCUserInfo()
        
        chat.title = "于海洋"
        self.navigationController?.pushViewController(chat, animated: true)

    }
    func ClickMenu2(){
        print("ClickMenu1")
    }
    func ClickMenu3(){
        print("ClickMenu1")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appdelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        appdelegate?.connectserver({ () -> Void in
            print("connectserver sucess 2 ")
//            异步链接
            
            //self.title = "connectserver sucess"
        })
        
        self.setDisplayConversationTypes([RCConversationType.ConversationType_PRIVATE.rawValue,
            RCConversationType.ConversationType_DISCUSSION.rawValue,
            RCConversationType.ConversationType_CHATROOM.rawValue,
            RCConversationType.ConversationType_GROUP.rawValue,
            RCConversationType.ConversationType_APPSERVICE.rawValue,
            RCConversationType.ConversationType_SYSTEM.rawValue])
        //设置需要将哪些类型的会话在会话列表中聚合显示
        self.setCollectionConversationType([RCConversationType.ConversationType_DISCUSSION.rawValue,
            RCConversationType.ConversationType_GROUP.rawValue])
        self.refreshConversationTableViewIfNeeded()
        
        
        
        //初始化UIRefreshControl
//        var rc = UIRefreshControl()
//        rc.attributedTitle = NSAttributedString(string: "下拉刷新")
//        rc.addTarget(self, action: "refreshTableView", forControlEvents: UIControlEvents.ValueChanged)
//        self.refreshControl = rc
        
        // Do any additional setup after loading the view.
    }
    
    

    
    
    
    //重写RCConversationListViewController的onSelectedTableRow事件
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
        
        self.tabBarController?.tabBar.hidden = true
        
        //打开会话界面
        let chat = RCConversationViewController(conversationType: model.conversationType, targetId: model.targetId)
        
        //let userInfo = RCUserInfo()
        
        chat.title = model.targetId
        self.navigationController?.pushViewController(chat, animated: true)
        
        //此处重新定义了RCConversationViewController，此界面和空间界面功能是一样的，所以，这里如果以之中方式进行打开聊天窗口，
//        那么久不需要重新添加一个聊天的控制器了
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        self.tabBarController?.tabBar.hidden = true
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
