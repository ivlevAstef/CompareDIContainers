//
//  DI.swift
//  Sample
//
//  Created by Alexander Ivlev on 07/02/2017.
//  Copyright © 2017 Tenzor. All rights reserved.
//

import Dip
import Dip_UI


let module: DependencyContainer = {
  let container = DependencyContainer()
  
  container.register { UIStoryboard(name: "Main", bundle: Bundle.main) }
  
  container.register(tag: "myVC") { ViewController() }
    .resolvingProperties { container, vc in
      vc.generator = try! container.resolve()
  }
  
  container.register {
    try! ServerRandomStatementGenerator(server: container.resolve()) as RandomStatementGenerator
  }
  
  container.register {
    MockRandomStatementGenerator() as RandomStatementGenerator
  }
  
  container.register(.singleton) { Server(host: "host", domain: "domain") }
  
  DependencyContainer.uiContainers = [container]
  
  return container
}()

extension ViewController: StoryboardInstantiatable {
}
