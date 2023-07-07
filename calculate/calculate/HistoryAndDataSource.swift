import Foundation

class History {
    private var history: [String] = []
    
    func addHistory(_ string: String) {
        history.append(string)
    }
    
    func moveHistory() -> [String]{
        return history
    }
}
