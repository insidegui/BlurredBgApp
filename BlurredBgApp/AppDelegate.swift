//
//  AppDelegate.swift
//  BlurredBgApp
//
//  Created by Guilherme Rambo on 13/06/19.
//  Copyright © 2019 Guilherme Rambo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.isOpaque = false
        window?.backgroundColor = .clear
        
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

