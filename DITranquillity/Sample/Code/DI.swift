//
//  DI.swift
//  Sample
//
//  Created by Alexander Ivlev on 07/02/2017.
//  Copyright © 2017 Tenzor. All rights reserved.
//

import DITranquillity

class SampleModule: DIModule {
  func load(builder: DIContainerBuilder) {
    builder.register(UIStoryboard.self)
      .initializer{ scope in DIStoryboard(name: "Main", bundle: Bundle.main, container: scope) }
    
    builder.register(vc: ViewController.self)
      .dependency{ scope, vc in vc.generator = *!scope }
    
//    builder.register(RandomStatementGenerator.self)
//      .initializer { scope in ServerRandomStatementGenerator(server: *!scope) }
    
    builder.register(RandomStatementGenerator.self)
      .initializer { MockRandomStatementGenerator() }
    
    builder.register { Server(host: "host", domain: "domain") }
      .lifetime(.lazySingle)
  }
}
