//
//  AppDelegate.swift
//  CategoryQC
//
//  Created by Vladislav Dorfman on 09/05/2017.
//  Copyright © 2017 Vladislav Dorfman. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = ViewController()
        window!.makeKeyAndVisible()
    }
}
