//
//  Peredacha.swift
//  calculate
//
//  Created by Gleb Gurev on 14.08.2023.
//

import UIKit

class Peredacha: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func app(_ cell: String) -> String {
        let prev = cell
            .split(separator: "=")
            .dropFirst()
            .map{ String($0)}.joined()
        
        return prev
    }
}
