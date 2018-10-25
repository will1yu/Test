import Foundation

let list:[Int] = [1, 2, 3, 4]

var result = [[Int]]()

var book = [Bool]() // 记录已经使用的
var temp = [Int]()  // 盒子

for _ in 0..<list.count {
    book.append(true)
    temp.append(0)
}

func dfs(step: Int) {   // step 目前正在第几个盒子
    if step == list.count {
        let oneSort = temp
        result.append(oneSort)
        return
    }
    
    for i in 0..<list.count {
        if book[i] {
            temp[step] = list[i]
            book[i] = false // 记录第i已经使用了
            
            dfs(step: step+1) // 找下一个盒子放什么
            
            book[i] = true  // 还原i
        }
    }
}

dfs(step: 0)
print(result)
