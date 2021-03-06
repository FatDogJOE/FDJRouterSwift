//
//  AppDelegate.swift
//  FDJRouterSwift
//
//  Created by likethephoenix@163.com on 12/27/2019.
//  Copyright (c) 2019 likethephoenix@163.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FDJRouter.instance.register(url: "https://www.router.com/path1", constructor: TestController1.constructor)
        FDJRouter.instance.register(url: "https://www.router.com/path2", constructor: TestController2.constructor)
        FDJRouter.instance.register(url: "https://www.router.com/path3", constructor: TestController3.constructor)
        FDJRouter.instance.register(url: "https://www.router.com/path1/path4", constructor: TestController4.constructor)
        FDJRouter.instance.register(url: "https://www.router.com/path2/path5", constructor: TestController5.constructor)
        FDJRouter.instance.register(url: "https://www.router.com/path3/path6", constructor: TestController6.constructor)
        FDJRouter.instance.register(url: "https://www.router.com/path1/path4/path7", constructor: TestController7.constructor)
        FDJRouter.instance.register(url: "https://www.router.com/path2/path5/path8", constructor: TestController8.constructor)
        FDJRouter.instance.register(url: "https://www.router.com/path3/path6/path9", constructor: TestController9.constructor)
        
        FDJRouter.instance.setupRootPages(rootURLs: ["https://www.router.com/path1","https://www.router.com/path2","https://www.router.com/path3"])
        self.window?.rootViewController = FDJRouter.instance.tabBarController
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

