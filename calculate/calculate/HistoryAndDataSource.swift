//
//  HistoryAndDataSource.swift
//  calculate
//
//  Created by Gleb Gurev on 05.07.2023.
//

import Foundation


class HistoryAndDataSource {
   
    
   private var history: [String] = []
    
    
    func addHistory(_ historyString: String) {
        history.append(historyString)
    }
    
    func getHistoryAll() -> [String] {
        return history
    }
    
}
