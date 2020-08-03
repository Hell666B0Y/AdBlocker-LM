//
//  AppDelegate.swift
//  kk
//
//  Created by Воробьев Александр on 5/6/20.
//  Copyright © 2020 Serioga. All rights reserved.
//

import UIKit
import SafariServices

@UIApplicationMain


class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // - UI
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> (Bool)  {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc1 = UIStoryboard(name: "Setup", bundle: nil).instantiateInitialViewController()
        let vc2 = UIStoryboard(name: "MainPage", bundle: nil).instantiateInitialViewController()
        
        window?.rootViewController = vc1
        
        SFContentBlockerManager.getStateOfContentBlocker(withIdentifier: "Serioga.AdBlocker LM.ContentBlock") { [weak self] (state, error) in
            DispatchQueue.main.async {
                if let state = state {
                    if state.isEnabled {
                        self?.window?.rootViewController = vc2
                    } else {
                        self?.window?.rootViewController = vc1
                    }
                } else {
                    self?.window?.rootViewController = vc1
                }
                self?.window?.makeKeyAndVisible()
            }
            
        }
        
        return true
        
    }
    
}


