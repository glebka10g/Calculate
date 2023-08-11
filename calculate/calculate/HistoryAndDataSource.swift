import Foundation


class History {
    
    private var chet: [String: [String]] = [:]
    private let date = Date()
    private let dateFormatter = DateFormatter()
    private var chetTest: [String] = []
    private var defaults = UserDefaults.standard
    
    func app (test: String) {
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        let currentDate = dateFormatter.string(from: date)
        
        if let testValue = defaults.dictionary(forKey: "test3")  as? [String: [String]]{
            chet = testValue
        }
        
        if var expressions = chet[currentDate] {
            expressions.append(test)
            chet[currentDate] = expressions
        } else {
            chet[currentDate] = [test]
        }
        
        defaults.set(chet, forKey: "test3")
    }
}


