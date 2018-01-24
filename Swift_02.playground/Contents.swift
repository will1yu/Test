//: Playground - noun: a place where people can play

import UIKit

// Tuple 元组

let http404Error = (404, "Not Found")
// http404Error 的类型为(Int, String)


let (statusCode, statusMessage) = http404Error
print("状态码是 \(statusCode)")
NSLog("状态消息是 %@", statusMessage)


