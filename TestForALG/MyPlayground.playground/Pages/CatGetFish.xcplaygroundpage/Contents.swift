import Foundation

class m_Queue {
    var name: String
    var data: [Int] = [Int]()
    var head: Int = 0
    var tail: Int {
        return data.count
    }
    
    var resultList: [Int] {
        var result = [Int]()
        if data.count > 0 {
            for item in head..<tail {
                result.append(data[item])
            }
        }
        return result
    }
    
    init(name: String) {
        self.name = name
    }
}

class m_stack {
    var data: [Int] = [Int]()
    var top: Int = -1
    var currentData: [Int] {
        var result = [Int]()
        if data.count > 0 {
            for item in 0..<top {
                result.append(data[item])
            }
        }
        return result
    }
}

var q1: m_Queue = m_Queue(name: "q1")
var q2: m_Queue = m_Queue(name: "q2")

var data1 = [Int]()
var data2 = [Int]()

for _ in 0..<10 {
    data1.append(Int(arc4random()%10))
    data2.append(Int(arc4random()%10))
}

q1.data = data1
q2.data = data2

var stack = m_stack()

func showNumber(list: m_Queue) {
    let temp = list.data[list.head]
    print("\(list.name) 的出牌环节，\(list.data), 准备打出排在第\(list.head)的\(temp)")
    
    var sameFlag = false
    for item in stack.currentData {
        if item == temp {
            sameFlag = true
        }
    }
    
    print("当前桌面: \(stack.currentData), \(sameFlag ? "存在" : "不存在")一样的牌")
    if sameFlag {
        list.head += 1
        list.data.append(temp)
        
        while stack.top > 0 {
            let top = stack.top
            list.data.append(stack.data[top])
            stack.top -= 1
            
            if stack.data[top] == temp {
                break
            }
        }
    } else {
        list.head += 1
        stack.top += 1
        
        if stack.data.count > stack.top {
            stack.data[stack.top] = temp
        } else {
            stack.data.append(temp)
        }
    }
    
    print("\(list.name)的出牌环节结束")
}

print("game start")
print("q1 \(q1.data)")
print("q2 \(q2.data)")

while q1.head < q1.tail && q2.head < q2.tail {
    showNumber(list: q1)
    showNumber(list: q2)
}

print("游戏结束")
print("q1: \(q1.resultList)")
print("q2: \(q2.resultList)")
if q1.head == q1.tail {
    print("q2 win, \(q2.resultList)")
    if !stack.data.isEmpty {
        print("stack \(stack.data)")
    }
} else {
    print("q1 win, \(q1.resultList)")
    if !stack.data.isEmpty {
        print("stack \(stack.data)")
    }
}
