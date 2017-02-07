//
//  AppDelegate.swift
//  Sample
//
//  Created by Alexander Ivlev on 07/02/2017.
//  Copyright © 2017 Tenzor. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func applicationDidFinishLaunching(_ application: UIApplication) {
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let assembly = SampleAssembly().activated()
    
    let storyboard = assembly.storyboard() as! UIStoryboard
    
    window!.rootViewController = storyboard.instantiateInitialViewController()
    window!.makeKeyAndVisible()
  }

}

