//
//  AppDelegate.swift
//  RongCloudIMtest_yuhy0412
//
//  Created by ocean.yu on 16/4/12.
//  Copyright © 2016年 ocean.yu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , RCIMUserInfoDataSource {

    var window: UIWindow?

    
    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        let userInfo = RCUserInfo()
        userInfo.userId = userId
        
        switch userId{
            case "oceanyu":
                userInfo.name = "于海洋"
                userInfo.portraitUri = "http://ww1.sinaimg.cn/crop.3.45.1919.1919.1024/6b805731jw1em0hze051hj21hk1isn5k.jpg"
            case "oceanwang":
                userInfo.name = "王海洋"
                userInfo.portraitUri = "http://f.hiphotos.baidu.com/zhidao/pic/item/241f95cad1c8a7862495b8776109c93d70cf5008.jpg"
            default :
                print("")
            
            
        }
        return completion(userInfo)
    }
    
    func connectserver(completion:()->Void){
         RCIM.sharedRCIM().initWithAppKey("pkfcgjstfloo8")
        RCIM.sharedRCIM().connectWithToken("KsQLk8niTtnoiOzC32HDmitU6PHPP/Km+E5rvUJDFDmt5WHUnmnXhF5bIxe7rbt35JTVu0dlGQFtXiz8or7GZg==",
            success: { (_) -> Void in
                
                //NSLog("sucess")
                
                let currenUser = RCUserInfo(userId: "oceanyu", name: "海洋", portrait: "http://imgtest-dl.meiliworks.com/pic/m/7f/52/de1a09f3092151483c96c5d57baa_410_410.c1.jpg")
    
                RCIMClient.sharedRCIMClient().currentUserInfo = currenUser
                
                
                print("connectserver sucess 1 ")
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    completion()
                })
                
                
                
            },
            error: { (_) -> Void in
                
                NSLog("error")
            })
            { () -> Void in
                NSLog("in")
        }
        
        
        
        
        
    }
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        //modify by yuhy 
        //获取leancloud 授权
        
        // applicationId 即 App Id，clientKey 是 App Key。
//        [AVOSCloud setApplicationId:@"83gX8eqGeUdLiiDXjOev2tr1-gzGzoHsz"
//        clientKey:@"wcDOqJ6Euf36WlgziLHV0xDV"];
        AVOSCloud.setApplicationId("83gX8eqGeUdLiiDXjOev2tr1-gzGzoHsz", clientKey: "wcDOqJ6Euf36WlgziLHV0xDV")
        
        
        
        RCIM.sharedRCIM().userInfoDataSource = self
 
        //end by yuhy
//             let currenUser = RCUserInfo(userId: "oceanyu", name: "海洋", portrait: "http://imgtest-dl.meiliworks.com/pic/m/7f/52/de1a09f3092151483c96c5d57baa_410_410.c1.jpg")
//        
//        RCIMClient.sharedRCIMClient().currentUserInfo = currenUser
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

