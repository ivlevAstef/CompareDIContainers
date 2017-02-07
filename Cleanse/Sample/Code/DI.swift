//
//  DI.swift
//  Sample
//
//  Created by Alexander Ivlev on 07/02/2017.
//  Copyright © 2017 Tenzor. All rights reserved.
//

import Cleanse

/// короче тут без бутылки не разберешься
/// под полное счасть нет поддержки storyboard

extension ViewController {
  struct Module: Cleanse.Module {
    static func configure<B : Binder>(binder: B) {
      binder.bind()
        .to(factory: ViewController.init)
    }
  }
}


extension RandomStatementGenerator {
  struct Module: Cleanse.Module {
    static func configure<B : Binder>(binder: B) {
      binder.bind()
        .to{ ServerRandomStatementGenerator(server:) }
    }
  }
}

extension Server {
  struct Module: Cleanse.Module {
    static func configure<B : Binder>(binder: B) {
      binder.bind()
        .to{ Server(host: "host", domain: "domain") }
    }
  }
}
