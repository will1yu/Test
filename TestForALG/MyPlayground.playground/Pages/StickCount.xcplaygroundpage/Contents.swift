import Foundation

let stickCount: [Int] = [6, 2, 5, 5, 4, 5, 6, 3, 7, 6]

/*
func fun(x: Int) -> Int{
    var num = 0
    var temp = x
    
    while temp/10 != 0 {
        num += stickCount[temp%10]
        temp = temp / 10
    }
    
    num += stickCount[temp]
    return num
}

let m = 18
var sum = 0

for a in 0...1111 {
    for b in 0...1111 {
        let c = a + b
        
        if fun(x: a) + fun(x: b) + fun(x: c) == m - 4 {
            print("a: \(a) + b: \(b) = c: \(c)")
            sum += 1
        }
    }
}

print("总共有\(sum)种")
*/

var result = [[Int]]()
var temp = [Int]()
var mark = [Bool]()

for _ in 0..<9 {
    temp.append(0)
    mark.append(true)
}

func dfs_count(step: Int) {
    if step == 9 {
        let once = temp
        if temp[0] * 100 + temp[1] * 10 + temp[2] + temp[3] * 100 + temp[4] * 10 + temp[5] == temp[6] * 100 + temp[7] * 10 + temp[8]  {
            
            result.append(once)
        }
        return
    }
    
    for i in 0..<9 {
        if mark[i] {
            temp[step] = i + 1
            mark[i] = false
            
            dfs_count(step: step + 1)
            
            mark[i] = true
        }
    }
}

dfs_count(step: 0)

for item in result {
    print(item)
}
