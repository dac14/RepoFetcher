//
//  AppDelegate.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 22/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var appCoordinator: AppCoordinatorProtocol?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupApplicationOnStart()
        
        return true
    }
    
    private func setupApplicationOnStart() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
    }
}

