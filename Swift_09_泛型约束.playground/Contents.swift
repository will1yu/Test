//: Playground - noun: a place where people can play

import UIKit

/////////////
/// 泛型
func swap<T>( a: inout T, b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func testOne() {
    var someInt = 3
    var anotherInt = 107
    // 给inout参数传参时，不要忘记加（&）
    swap(&someInt, &anotherInt)
    print("\(someInt) - \(anotherInt)")
    
    var someStr = "123"
    var anotherStr = "456"
    swap(&someStr, &anotherStr)
    print("\(someStr) - \(anotherStr)")
}
testOne()

var moneyList = [1, 3, 10, 5, 4]
var moneyStrListA = moneyList.map { "\($0)$" }
var moneyStrListB = moneyList.map { item -> String in
    return "\(item)!"
}


////////////
/// 约束

func isEqual<T:Equatable>(left: T, right: T) -> Bool {
    return left == right
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

