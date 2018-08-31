//: Playground - noun: a place where people can play

import UIKit

/// 闭包

// 闭包作为返回值
func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

////////
// 闭包的几种写法
var numbers = [11, 2, 34, 235]
func sort(array: [Int], _ compareFunc: (Int, Int)->Bool) -> [Int] {
    // empty
    return array
}

func compare(i1: Int, i2: Int) -> Bool {
    return i1 > i2
}
// 基础
var sortedNumberA = sort(array: numbers, compare)
//
var sortedNumberB = sort(array: numbers, { (i1: Int, i2: Int) -> Bool in return i1 > i2})

var sortedNumberC = sort(array: numbers) { (i1: Int, i2: Int) -> Bool in
    return i1 > i2
}

var sortedNumberD = sort(array: numbers, {i1, i2 in return i1 > i2})

var sortedNumberE = sort(array: numbers) {i1, i2 in return i1 > i2}

var sortedNumberF = sort(array: numbers, {$0 > $1})

var sortedNumberG = sort(array: numbers, >)

