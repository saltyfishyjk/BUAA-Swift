import UIKit

/* ---------- Defination and call ----------  */
// T1
func printCapitalInfo(name:String, country:String, population:String) {
    print("\(name) is the capital of \(country) and its population is \(population).")
}
printCapitalInfo(name: "Beijing", country: "China", population: "23 million")

// T2
func calculateCapitalInfo(name:String, country:String, population:String) -> (String, Int) {
    print("\(name) is the capital of \(country) and its population is \(population).")
    return (name, name.count)
}
calculateCapitalInfo(name: "Beijing", country: "China", population: "23 million")

/* ---------- Format Arguments ---------- */
// T1
func computeMultiply() -> Int {
    var cnt:Int = 10
    var ans:Int = 1
    while (cnt >= 1) {
        ans *= cnt
        cnt -= 1
    }
    return ans
}
computeMultiply()

// T2
func printMultiply() {
    var cnt:Int = 10
    var ans:Int = 1
    while (cnt >= 1) {
        ans *= cnt
        cnt -= 1
    }
    print(ans)
}
printMultiply()

// T3
func computeMultiply2(multipliers : Int...) -> Int {
    var ans:Int = 1
    for num in multipliers {
        ans *= num
    }
    return ans
}

// T4
var numbers:[Int] = [29, 34, 1, 3, 5, 9, 11, 43]
print(numbers)
func sortArray(intArray:inout [Int]) {
    intArray.sort()
}
sortArray(intArray: &numbers)
print(numbers)
/* 函数调用前是初始化时的数组，函数调用后数组变为升序，差别为从乱序到有序，原因是使用了inout，使得可以修改传入的参数 */

/* ---------- Func Type ---------- */
// T1
var printAction : ()->() = printMultiply
var mathOperation : (Int...)->(Int) =  computeMultiply2
printAction
mathOperation(1,2,3,4)
// T2
func multiply(a:Int, b:Int) -> Int {
    return a * b
}
func divide(a:Int, b:Int) -> Int {
    return a / b
}
func printMathOperation(fun:(Int, Int)->Int, a:Int, b:Int) -> () {
    if a > b {
        print(fun(a, b))
    } else {
        print(fun(b, a))
    }
}
printMathOperation(fun: multiply, a: 3, b: 4)

// T3
func multiplyOrDivideOperation(op : String) -> (Int, Int)->Int {
    if op == ("Multiply") {
        return multiply
    } else {
        return divide
    }
}

var operation = multiplyOrDivideOperation(op: "Multiply")
printMathOperation(fun: operation, a: 4, b: 9)

/* ---------- Nest Func ---------- */
// T1
func multiplyOrDivideOperation(op : String, num1 : Int, num2 : Int) -> Int {
    func multiply2(a : Int, b : Int) -> Int {
        return a * b
    }
    func divide2(a : Int, b : Int) -> Int {
        return a / b
    }
    if op == "Multiply" {
        print(multiply2(a: num1, b: num2))
        return multiply2(a: num1, b: num2)
    } else {
        print(divide2(a: num1, b: num2))
        return divide2(a: num1, b: num2)
    }
}
multiplyOrDivideOperation(op: "ss", num1: 81, num2: 3)

/* --------- closure expression ---------- */
// T1
var compareClosure = {(a:Int, b:Int)->Bool in return a > b}
compareClosure(8, 10)
compareClosure(10, 8)

// T2
let numbers2:[Int] = [88, 128, 9, 3, 66, 16, 8]
numbers2.sorted(by: {(a:Int, b:Int)->Bool in return a > b})
print(numbers2)
numbers2.sorted(by: >)
print(numbers2)
numbers2.sorted(by: compareClosure)
print(numbers2)

// T3
var tempClosure = {()->() in
    var ans : Int = 0
    var cnt : Int = 100
    while cnt >= 1 {
        ans += cnt
        cnt -= 1
    }
    print(ans)
}
tempClosure()

// T4
numbers2.sorted(by:) {(a:Int, b:Int)->Bool in return a > b}

/* Closure application */
func marathonRace(speed:Int, racer:String) -> ()->Int {
    var remainDistnce:Int = 421950
    var racing = {
        remainDistnce -= speed
        print(racer + " left " + (String)(remainDistnce))
        return remainDistnce
    }
    return racing
}
var runnerJack:String = "Jack"
var speedJack:Int = 280
var runnerTom:String = "Tom"
var speedTom:Int = 315
var min : Int = 0
var JackMove = marathonRace(speed: speedJack, racer: runnerJack)
var TomMove = marathonRace(speed: speedTom, racer: runnerTom)
while true {
    min += 1
    var jackLeft = JackMove()
    var tomLeft = TomMove()
    if jackLeft <= 0 {
        print("Winner is Jack")
        break
    } else if tomLeft <= 0 {
        print("Winner is Tom")
        break
    }
}
// T2
var capitals : [String] = ["London", "DC", "Peking"]

capitals.forEach {
    print("Capitals :  \($0)")
}

var newCapitals = capitals.filter{
    return $0.contains("o")
}

var newCapitals2 = capitals.map{
    return $0.lowercased()
}

var s = capitals.reduce("Capitals are :") {
    return $0 + " " + $1
}
