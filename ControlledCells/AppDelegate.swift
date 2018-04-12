//
//  AppDelegate.swift
//  ControlledCells
//
//  Created by Connor Neville on 4/12/18.
//  Copyright © 2018 Connor Neville. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        configureWindow()
        return true
    }

}

extension AppDelegate {

    func configureWindow() {
        let window = UIWindow()
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        window.rootViewController = UIViewController()
        self.window = window
    }

}

