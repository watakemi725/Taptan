//
//  AppDelegate.swift
//  taptan
//
//  Created by Takemi Watanuki on 2015/02/23.
//  Copyright (c) 2015年 watakemi725. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var score : Float?

    var window: UIWindow?
    
    
    
    func grabStoryboard() -> UIStoryboard {
        var storyboard = UIStoryboard()
        var height = UIScreen.mainScreen().bounds.size.height
        
        if height == 480 {
            storyboard = UIStoryboard(name: "Main3.5", bundle: nil)
        } else {
            storyboard = UIStoryboard(name: "Main", bundle: nil)
        }
        return storyboard
    }


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        var storyboard: UIStoryboard = self.grabStoryboard()
        
//        self.window?.rootViewController =
//            storyboard.instantiateInitialViewController() as? UIViewController
        if let window = window { window.rootViewController = storyboard.instantiateInitialViewController() as? UIViewController }
        self.window?.makeKeyAndVisible()
        

        /*
        
        let rect:CGRect = UIScreen.mainScreen().bounds
        if (rect.size.height == 480){
            
//            let storyboard = UIStoryboard(name: "threepointfive", bundle: nil)
////            let vc = storyboard.instantiateViewControllerWithIdentifier("myVCID") as UIViewController
//            let root: AnyObject = storyboard.instantiateViewControllerWithIdentifier("iPhone5") as UIViewController
////            self.window?.rootViewController = root as? UIViewController
//            self.window!.rootViewController = root as? UIViewController
            
            var mainView: UIStoryboard!
            mainView = UIStoryboard(name: "vcLogin", bundle: nil)
            let viewcontroller : UIViewController = mainView.instantiateViewControllerWithIdentifier("iPhone4") as UIViewController
            self.window!.rootViewController = viewcontroller
        }
        
        */
        
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

