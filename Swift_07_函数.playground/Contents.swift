import UIKit

/// 函数

// 无返回值
// 类型为 ()->()
func functionA() -> Void {
    
}

// 单返回值
// 类型为 (String)->String
func functionB(personName: String) -> String {
    return ""
}

// 多返回值
// 类型为 (Dictionary<String,String>)->(Int,Int)
func functionC(kids: [String: String]) -> (girls: Int, boys: Int) {
    return (1, 1)
}

//////////////////////
// 函数类型作为参数
func count(kids: [String: String]) -> (girls: Int, boys: Int) {
    var girls = 0, boys = 0
    for babyGender in kids.values {
        switch babyGender {
        case "Girl":
            girls += 1
        case "Boy":
            boys += 1
        default:
            print("error")
        }
    }
    
    return (girls, boys)
}

var countFounction: ([String: String]) -> (Int, Int) = count

func countFuncFacade(countFuc: ([String: String])->(Int, Int), kids:[String: String]) -> (Int, Int) {
    return countFuc(kids)
}

var kids = ["x1": "Girl", "x2": "Girl", "x3": "Boy"]

countFuncFacade(countFuc: count, kids: kids)

//////////////////////
// 函数类型作为返回值
func drawMoney(cardNumber: String, number: Int) -> Bool {
    print("\(cardNumber) draw Money \(number)")
    return true
}

func saveMoney(cardNumber: String, number: Int) -> Bool {
    print("\(cardNumber) save Money \(number)")
    return true
}

func chooseBankingBusiness(bankingBusiness: String) -> (String, Int) -> Bool {
    var bankingBusinessFunc = drawMoney
    if bankingBusiness == "取款" {
        bankingBusinessFunc = drawMoney
    } else if bankingBusiness == "存款" {
        bankingBusinessFunc = saveMoney
    }
    return bankingBusinessFunc
}

var bankingBusinessIdentifier: String = "取款"
let bankingBusiness = chooseBankingBusiness(bankingBusiness: bankingBusinessIdentifier)
bankingBusiness("12345", 123)

//////////////////////
// 嵌套函数
func chooseBankingBusinessB(bankingBusiness: String) -> (String)->Bool {
    func drawMoneyB(cardNumber: String) -> Bool {
        print("准备draw")
        return true
    }
    
    func saveMoneyB(cardNumber: String) -> Bool {
        print("准备save")
        return true
    }
    
    var bankingBusinessFuncB = drawMoneyB
    if bankingBusiness == "取款" {
        bankingBusinessFuncB = drawMoneyB
    } else if bankingBusiness == "存款" {
        bankingBusinessFuncB = saveMoneyB
    }
    
    return bankingBusinessFuncB
}

let bankingBusubessB = chooseBankingBusinessB(bankingBusiness: "存款")
bankingBusubessB("234")

//////////////////////
// 柯里化函数

// 普通形式
func calcA(x: Int, y: Int, z: Int) -> Int {
    return x+y+z
}

// 柯里化形式
func calcB(x: Int) -> ((Int)->(Int)->Int) {
    func calcInner1(y: Int) -> ((Int) -> Int) {
        func calcInner2(z: Int) -> Int {
            return x + y + z
        }
        return calcInner2
    }
    return calcInner1
}
let functA = calcB(x: 2)(3)(1)

// 隐式柯里化形式 3.0已废弃
//func calcC(x: Int)(y: Int)(z: Int) -> Int {
//    return x+y+z
//}
