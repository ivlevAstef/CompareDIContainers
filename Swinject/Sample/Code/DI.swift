//
//  DI.swift
//  Sample
//
//  Created by Alexander Ivlev on 07/02/2017.
//  Copyright © 2017 Tenzor. All rights reserved.
//

import Swinject
import SwinjectStoryboard

let module: Container = {
  let container = Container()
  
  container.register(UIStoryboard.self) { r in
    SwinjectStoryboard.create(name: "Main", bundle: Bundle.main, container: r)
  }
  
  container.storyboardInitCompleted(ViewController.self) { r, vc in
    vc.generator = r.resolve(RandomStatementGenerator.self)!
  }
  
  container.register(RandomStatementGenerator.self) { r in
    ServerRandomStatementGenerator(server: r.resolve(Server.self)!)
  }
  
  container.register(RandomStatementGenerator.self) { r in
    MockRandomStatementGenerator()
  }
  
  container.register(Server.self) { _ in
    Server(host: "host", domain: "domain")
  }
  
  return container
}()
