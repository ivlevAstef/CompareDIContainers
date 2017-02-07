//
//  ServerRandomStatementGenerator.swift
//  Sample
//
//  Created by Alexander Ivlev on 07/02/2017.
//  Copyright © 2017 Tenzor. All rights reserved.
//

import Foundation

class ServerRandomStatementGenerator: NSObject, RandomStatementGenerator {
  private let server: Server
  
  @objc init(server: Server) {
    self.server = server
  }
  
  func generate() -> RandomStatementWrapper {
    fatalError("Not implemented")
  }
}
