import Foundation

let list: [Int] = [95, 100, 35, 64 , 33, 10]

// 冒泡排序
var tempList = list
for i in 0..<tempList.count {
    for j in 0..<tempList.count {
        if tempList[i] < tempList[j] {
            tempList.swapAt(i, j)
        }
    }
}
print(tempList)

// 快速排序
func quickSort(list:inout [Int], left: Int, right: Int) {
    print("==== left:\(left),right:\(right), \(sortList)")
    guard left <= right else {
        return
    }
    
    let temp = list[left]
    var leftIndex = left
    var rightIndex = right
    
    while leftIndex != rightIndex {
        while list[rightIndex] >= temp && leftIndex < rightIndex {
            rightIndex -= 1
        }
        
        while list[leftIndex] <= temp && leftIndex < rightIndex {
            leftIndex += 1
        }
        
        if leftIndex < rightIndex {
            list.swapAt(leftIndex, rightIndex)
        }
    }
    
    list.swapAt(left, leftIndex)
    
    quickSort(list: &list, left: left, right: leftIndex - 1)
    quickSort(list: &list, left: leftIndex + 1, right: right)
}

var sortList = list
print(sortList)
quickSort(list: &sortList, left: 0, right: sortList.count - 1)
print(sortList)
