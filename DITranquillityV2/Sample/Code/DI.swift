//
//  DI.swift
//  Sample
//
//  Created by Alexander Ivlev on 07/02/2017.
//  Copyright © 2017 Tenzor. All rights reserved.
//

import DITranquillity

class SampleComponent: DIComponent {
  func load(builder: DIContainerBuilder) {
		builder.register(type: UIStoryboard.self)
      .initial { DIStoryboard(name: "Main", bundle: Bundle.main, container: $0) }
    
    builder.register(vc: ViewController.self)
			.injection { $0.generator = $1 }
    
		//builder.register(type: ServerRandomStatementGenerator.init(server:))
		//	.as(RandomStatementGenerator.self)
    
    builder.register(type: MockRandomStatementGenerator.init)
      .as(RandomStatementGenerator.self)
    
    builder.register{ Server(host: "host", domain: "domain") }
      .lifetime(.lazySingle)
  }
}

let container: DIContainer = {
  let builder = DIContainerBuilder()
  builder.register(component: SampleComponent())
  
  return try! builder.build()
}()
