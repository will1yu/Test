import Foundation

/*
 https://www.codewars.com/kata/sudoku-solver/train/python
var puzzle = [
    [5,3,0,0,7,0,0,0,0],
    [6,0,0,1,9,5,0,0,0],
    [0,9,8,0,0,0,0,6,0],
    [8,0,0,0,6,0,0,0,3],
    [4,0,0,8,0,3,0,0,1],
    [7,0,0,0,2,0,0,0,6],
    [0,6,0,0,0,0,2,8,0],
    [0,0,0,4,1,9,0,0,5],
    [0,0,0,0,8,0,0,7,9]]
*/

let commomList = [1, 2, 3, 4, 5, 6, 7, 8, 9]

func sudoku(puzzle: [[Int]]) {
    
}

func allRange(list: [Int]) {
    // 原始数据
    let originArr = list
    // 单行标准数字
    var commomArr = commomList
    // 需要保持不变的位置
    var keepIndex = [Int]()
    
    var tempArr = originArr
    let removeList = tempArr
    
    for (index, item) in removeList.enumerated().reversed() {
        if item == 0 {
            tempArr.remove(at: index)
            
        } else {
            
            keepIndex.append(index)
        }
    }
    
    tempArr
    commomArr
    keepIndex
}

let test = [5,3,0,0,7,0,0,0,0]
allRange(list: test)

