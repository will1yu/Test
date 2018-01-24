//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let possibleNumber = "123"

let convertedNumber = Int(possibleNumber)

var convertedNumberA : Int?

// 强制解封
if (convertedNumber != nil) {
    convertedNumberA = convertedNumber!
} else {
    convertedNumberA = nil
}

// 可选绑定
if let convertedNumberB = convertedNumber {
    convertedNumberB
}

// 隐式解封
var convertedNumberC : Int! = convertedNumber!

