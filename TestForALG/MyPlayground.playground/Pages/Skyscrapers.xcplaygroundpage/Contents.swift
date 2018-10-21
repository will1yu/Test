import UIKit
import Foundation

// https://www.codewars.com/kata/6-by-6-skyscrapers/train/javascript

/*
let clues: [Int] = [3, 2, 2, 3, 2, 1,
                    1, 2, 3, 3, 2, 2,
                    5, 1, 2, 2, 4, 3,
                    3, 2, 1, 2, 2, 4]

let expected: [[Int]] = [
    [2, 1, 4, 3, 5, 6],
    [1, 6, 3, 2, 4, 5],
    [4, 3, 6, 5, 1, 2],
    [6, 5, 2, 1, 3, 4],
    [5, 4, 1, 6, 2, 3],
    [3, 2, 5, 4, 6, 1]
]
 */

let number = [1, 2, 3, 4, 5, 6]
var singleLine: [Int] = [Int]()

func m_swap<T>(array: inout [T], index1: Int, index2: Int) {
    let temp = array[index1]
    array[index1] = array[index2]
    array[index2] = temp
}

var count: Int = 0
var round: Int = 0
func allRange<T>(array: inout [T], start: Int, end: Int) {
    round += 1
    print("\nround: \(round), start: \(start), end: \(end), array: \(array)")
    
    var temp = array
    if start == end - 1 {
        let data = Array(array[0..<end])
        count += 1
        print("====结果 \(data)")
    } else {
        print("-- start:\(start) != end-1:\(end-1)")
        
        var times: Int = 0
        for i in start..<end {
            times += 1
            if i != start {
                print("---time:\(round)-\(times) i:\(i) != start:\(start) = \(temp)")
                print("--- \(temp[i])和\(temp[start])互换")
                temp.swapAt(i, start)
                print("--- 互换后为\(temp)")
            } else {
                print("---time:\(round)-\(times) i:\(i) == start:\(start) = \(temp)")
            }
            
            allRange(array: &temp, start: start+1, end: end)
            
            if i != start {
                print("---time:\(round)-\(times) i:\(i) != start:\(start) = \(temp)")
                print("--- \(temp[i])和\(temp[start])互换")
                temp.swapAt(i, start)
                print("--- 互换后为\(temp)")
            } else {
                print("---time:\(round)-\(times) i:\(i) == start:\(start) = \(temp)")
            }
        }
    }
}

var numberListA = [1, 2, 3, 4]
allRange(array: &numberListA, start: 0, end: numberListA.count)
count

