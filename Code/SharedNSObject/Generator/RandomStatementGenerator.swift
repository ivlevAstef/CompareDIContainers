//
//  RandomStatementGenerator.swift
//  Sample
//
//  Created by Alexander Ivlev on 07/02/2017.
//  Copyright © 2017 Tenzor. All rights reserved.
//

import Foundation

@objc
protocol RandomStatementGenerator {
  func generate() -> RandomStatementWrapper
}
