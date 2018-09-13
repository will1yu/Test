//: Playground - noun: a place where people can play

import UIKit
import Foundation

// ErrorType?
public enum AgeError : Error {
    case AgeTooSmall
    case AgeTooLarge
    
    case AgeNotAdult
}

class Person {
    var age: Int
    init(_ age: Int) {
        self.age = age
    }
}

let p1 = Person(-5)
let p2 = Person(5)

/******************************/

func checkPersonAgeA(p: Person) {
    
    // 在 do 代码块中 throw 一个 error
    // 一旦这个 error 确实发生了
    // 那么就会立即跳转至对应的 catch 代码块来处理相应的 error
    
    // 在函数内部进行 throw 操作，且在内部 catch 了这个 error
    
    do {
        if p.age < 0 {
            throw AgeError.AgeTooSmall
        } else if p.age > 200 {
            throw AgeError.AgeTooLarge
        }
        
        print("这是个正常人")
    } catch AgeError.AgeTooSmall {
        print("这个人怎么越活越小？？？")
    } catch AgeError.AgeTooLarge {
        print("这个人是神仙？？？")
    } catch {
        print("总之这个人不正常")
    }
}

// 此时函数类型从 (Person) -> ()
// 变成了 (Person) throws -> ()
func checkPersonAgeB(p: Person) throws -> () {
    if p.age < 0 {
        throw AgeError.AgeTooSmall
    } else if p.age > 200 {
        throw AgeError.AgeTooLarge
    }
}


func callerA() {
    let pp = Person(-5)
    
    do {
        try checkPersonAgeB(p: pp)
    } catch AgeError.AgeTooSmall {
        print("这个人怎么越活越小？？？")
    } catch AgeError.AgeTooLarge {
        print("这个人是神仙？？？")
    } catch {
        print("总之这个人不正常")
    }
}

func callerB() throws {
    let pp = Person(-5)
    try checkPersonAgeB(p: pp)
}

/*************
 try!
 try?
 *************/

func checkPersonAgeC(p: Person) throws -> Person {
    if p.age < 0 {
        throw AgeError.AgeTooSmall
    } else if p.age > 200 {
        throw AgeError.AgeTooLarge
    } else {
        return p
    }
}

// p3: Person?
let p3 = try? checkPersonAgeC(p: p1)

let p4 = try! checkPersonAgeC(p: p2)


/*************
 rethrows
 *************/

// throw异常，这表示这个函数可能会抛出异常，无论作为参数的闭包是否抛出异常
// rethrow异常，这表示这个函数本身不会抛出异常，但如果作为参数的闭包抛出了异常，那么它会把异常继续抛上去

// https://www.jianshu.com/p/802ff8969952

extension Array {
    func _map<T>(transform: (Iterator.Element) throws -> T) rethrows -> [T] {
        var ts = [T]()
        for e in self {
            ts.append(try transform(e))
        }
        return ts
    }
}

enum CalculationError: Error {
    case DivideByZero
}

func squareOf(x: Int) -> Int {return x*x}

func divideTenBy(x: Int) throws -> Double {
    guard x != 0 else {
        throw CalculationError.DivideByZero
    }
    return 10.0 / Double(x)
}

let xs = Array(1...3)

let ns2 = xs._map(transform: squareOf)

let ns3: [Double]
do {
    try ns3 = xs._map(transform: divideTenBy)
} catch {
    
}

