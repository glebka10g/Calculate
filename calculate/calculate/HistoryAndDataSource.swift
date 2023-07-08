import Foundation


class History {
    private let date = Date()
    private let dateFormatter = DateFormatter()
    private let defaults = UserDefaults.standard
    
    private var history: [String] = []
    
    func addHistory(_ string: String) {
        history.append(string)
        if defaults.stringArray(forKey: "expression2") == nil {
            defaults.set(history, forKey: "expression2")
        } else if defaults.stringArray(forKey: "expression2") != nil {
            var secondArray = defaults.stringArray(forKey: "expression2")
            secondArray!.append(history.joined(separator: ""))
            defaults.set(secondArray, forKey: "expression2")
        }
        history = []
    }

    func datee() -> Int {
        var countDate = 0
        var allDate: [String] = []
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        allDate.append(dateFormatter.string(from: date))
        if defaults.stringArray(forKey: "dateHistory") == nil {
            defaults.set(allDate, forKey: "dateHisotry")
        } else if defaults.stringArray(forKey: "dateHistory") != nil {
            var secondDateHistory = defaults.stringArray(forKey: "dateHistory")
            secondDateHistory!.append(allDate.joined(separator: ""))
            allDate = []
            defaults.set(secondDateHistory, forKey: "dateHistory")
        }
        countDate += 1
        return countDate
    }
    
}

