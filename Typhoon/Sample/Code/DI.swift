//
//  DI.swift
//  Sample
//
//  Created by Alexander Ivlev on 07/02/2017.
//  Copyright © 2017 Tenzor. All rights reserved.
//

import Typhoon

class SampleAssembly: TyphoonAssembly {
  dynamic func storyboard() -> Any {
    return TyphoonDefinition.withClass(TyphoonStoryboard.self) { definition in
      definition!.useInitializer(#selector(TyphoonStoryboard.init(name:factory:bundle:))) { initializer in
        initializer!.injectParameter(with: "Main")
        initializer!.injectParameter(with: self)
        initializer!.injectParameter(with: Bundle.main)
      }
    }
  }
  
  dynamic func viewController() -> Any {
    return TyphoonDefinition.withClass(ViewController.self) { definition in
      definition!.injectProperty(#selector(getter: ViewController.generator), with: self.mockGenerator()) //
    }
  }
  
  dynamic func serverGenerator() -> Any {
    return TyphoonDefinition.withClass(ServerRandomStatementGenerator.self) { definition in
      definition!.useInitializer(#selector(ServerRandomStatementGenerator.init(server:))) { initializer in
        initializer!.injectParameter(with: self.server())
      }
    }
  }
  
  dynamic func mockGenerator() -> Any {
    return TyphoonDefinition.withClass(MockRandomStatementGenerator.self)
  }
  
  dynamic func server() -> Any {
    return TyphoonDefinition.withClass(Server.self) { definition in
      definition!.useInitializer(#selector(Server.init(host:domain:))) { initializer in
        initializer!.injectParameter(with: "host")
        initializer!.injectParameter(with: "domain")
      }
      
      definition!.scope = .lazySingleton
    }
  }
}
