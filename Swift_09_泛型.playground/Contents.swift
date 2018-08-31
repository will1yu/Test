//: Playground - noun: a place where people can play

import UIKit

var moneyList = [1, 3, 10, 5, 4]
var monetStrList = moneyList.map { (item) -> T in
    return "\(item)?"
}


extension Collection where Element == String {
    func countWords() -> Int {
        return reduce(0) {
            let components = $1.components(separatedBy: .whitespacesAndNewlines)
            return $0 + components.count
        }
    }
}

let array2 = ["sunny", "cloudy", "apple orange"]
array2.countWords()
