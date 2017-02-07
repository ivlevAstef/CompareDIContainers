//
//  ServerRandomStatementGenerator.swift
//  Sample
//
//  Created by Alexander Ivlev on 07/02/2017.
//  Copyright © 2017 Tenzor. All rights reserved.
//

class ServerRandomStatementGenerator: RandomStatementGenerator {
  private let server: Server
  
  init(server: Server) {
    self.server = server
  }
  
  func generate() -> RandomStatement {
    fatalError("Not implemented")
  }
}
