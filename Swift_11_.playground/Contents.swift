//: Playground - noun: a place where people can play

import UIKit
import Foundation

// stride
for i in stride(from: 3, through: 0, by: -1) {
    print("- \(i)")
}

for i in stride(from: 3, to: 0, by: -1) {
    print("= \(i)")
}

/***********************************/

// swap的废弃
var a = 1
var b = 2
var c = 3

swap(&a, &b)
print("-- \(a), \(b)")

(b, a) = (a, b)
print("== \(a), \(b)")

(a, b, c) = (b, c, a)
print("=== \(a), \(b), \(c)")

// swapAt
var fruits = ["apple", "pear", "banana"]
fruits.swapAt(1, 2)

/***********************************/

// 从强制解包看swift的设计
// https://www.jianshu.com/p/705e716df0b8

