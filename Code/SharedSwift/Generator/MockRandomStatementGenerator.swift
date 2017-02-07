//
//  MockRandomStatementGenerator.swift
//  Sample
//
//  Created by Alexander Ivlev on 07/02/2017.
//  Copyright © 2017 Tenzor. All rights reserved.
//

import Foundation

class MockRandomStatementGenerator: RandomStatementGenerator {
  private static let statements: [RandomStatement] = [
    RandomStatement(statement: "Быть или не быть...", author: "Гамлет", year: .around(year: "примерно 1600")),
    
    RandomStatement(statement: "Лишь тот достоит жизни и свободы, кто каждый день за них идет на бой.", author: "Гёте", year: .around(year: "XVIII век")),
    
    RandomStatement(statement: "Если президенты не могут делать этого со своими женами, они делают это со своими странами.", author: "Иосиф Бродский", year: .around(year: "1940-1996")),
    
    RandomStatement(statement: "Вы говорите - время идет. Безумцы - это выпроходите.", author: "Талмуд", year: nil),
    
    RandomStatement(statement: "В молодости учатся, а в старости понимают.", author: "Мария Эшенбах", year: nil),
    
    RandomStatement(statement: "Знание не означает понимание.", author: nil, year: nil)
  ]
  
  func generate() -> RandomStatement {
    let statements = MockRandomStatementGenerator.statements
    return statements[Int(arc4random_uniform(UInt32(statements.count)))]
  }
}
