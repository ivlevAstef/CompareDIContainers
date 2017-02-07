//
//  AppDelegate.swift
//  Sample
//
//  Created by Alexander Ivlev on 07/02/2017.
//  Copyright © 2017 Tenzor. All rights reserved.
//

import UIKit
import DITranquillity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func applicationDidFinishLaunching(_ application: UIApplication) {
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let builder = DIContainerBuilder()
    builder.register(module: SampleModule())
    
    let container = try! builder.build()
    
    let storyboard: UIStoryboard = try! container.resolve()
    
    window!.rootViewController = storyboard.instantiateInitialViewController()
    window!.makeKeyAndVisible()
  }
}

