//
//  RandomStatement.swift
//  Sample
//
//  Created by Alexander Ivlev on 07/02/2017.
//  Copyright © 2017 Tenzor. All rights reserved.
//

struct RandomStatement {
  let statement: String // высказывание
  let author: String? // может быть неизвестен
  
  enum Year {
    case concrete(year: Int) // или точный год
    case around(year: String) // или словестное описание - около такого года
  }
  let year: Year? // может быть неизвестен
}
