//
//  Server.swift
//  Sample
//
//  Created by Alexander Ivlev on 07/02/2017.
//  Copyright © 2017 Tenzor. All rights reserved.
//

import Foundation

class Server: NSObject {
  let host: String
  let domain: String
  
  @objc init(host: String, domain: String) {
    self.host = host
    self.domain = domain
  }
}
