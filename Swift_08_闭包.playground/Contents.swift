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

////////
// 闭包的捕获值
let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let incrementbySeven = makeIncrementor(forIncrement: 7)
incrementbySeven()
incrementByTen()

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

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
// 闭包表达式
var sortedNumberB = sort(array: numbers, { (i1: Int, i2: Int) -> Bool in return i1 > i2})
// 尾闭包写法1
var sortedNumberC = sort(array: numbers) { (i1: Int, i2: Int) -> Bool in
    return i1 > i2
}
// 闭包表达式 简化1
var sortedNumberD = sort(array: numbers, {i1, i2 in return i1 > i2})
// 尾闭包写法2
var sortedNumberE = sort(array: numbers) {i1, i2 in return i1 > i2}
// 闭包表达式 简化2
var sortedNumberF = sort(array: numbers, {$0 > $1})
// 闭包表达式 简化3
var sortedNumberG = sort(array: numbers, >)
