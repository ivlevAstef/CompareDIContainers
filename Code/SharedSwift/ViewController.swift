//
//  ViewController.swift
//  Sample
//
//  Created by Alexander Ivlev on 07/02/2017.
//  Copyright © 2017 Tenzor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  private var generator: RandomStatementGenerator!
  
  @IBOutlet private var statementLbl: UILabel!
  @IBOutlet private var authorLbl: UILabel!
  @IBOutlet private var yearLbl: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    generateStatement()
  }

  @IBAction private func clickMoreStatements(_ sender: Any) {
    generateStatement()
  }
  
  private func generateStatement() {
    DispatchQueue.global(qos: .userInitiated).async {
      let statement = self.generator.generate()
      
      DispatchQueue.main.async {
        self.set(statement: statement)
      }
      
    }
  }
  
  private func set(statement: RandomStatement) {
    assert(Thread.isMainThread)
    
    statementLbl.text = statement.statement
    
    if let author = statement.author {
      authorLbl.text = "Автор: \(author)"
    } else {
      authorLbl.text = "Автор неизвестен"
    }
    
    switch statement.year {
    case .some(.concrete(let year)):
      yearLbl.text = "Год: \(year)"
    case .some(.around(let year)):
      yearLbl.text = "Год: \(year)"
    case .none:
      yearLbl.text = "Год неизвестен"
    }
  }
}

