import Foundation
// Experiment4
// Part 1 Enum Type
// T1
enum Direction : Int {
    case East=0
    case South
    case West
    case North
}

func adjacentCity(direction:Direction) -> String{
    if direction == Direction.East {
        return ("Peking")
    } else if direction == Direction.North {
        return ("Harbin")
    } else if direction == Direction.South {
        return ("Nanjing")
    } else {
        return ("Paris")
    }
}

let northNeighbour = adjacentCity(direction: Direction.North)
print(northNeighbour) // will get error

// T2
let currentDirection = Direction.North
print(currentDirection)

// T3
enum Direction3 : String {
    case East
    case South
    case West
    case North
}

let currentDirection3 = Direction3.North
print(currentDirection3)

// T4
enum OperationFeedBack {
    case Done(Int)
    case Fail(String)
}
var balanceOfAtm = 10000
func withdrawFromATM(amount:Int) -> OperationFeedBack {
    if balanceOfAtm >= amount {
        balanceOfAtm -= amount
        return OperationFeedBack.Done(balanceOfAtm)
    } else {
        return OperationFeedBack.Fail("Fail to withdraw money : NO ENOUGH BALANCE")
    }
}

var getMoney = withdrawFromATM(amount: 1288)
print(getMoney)
// Part 2 Struct and Class
// T1
struct Coordinate {
    var x:Float
    var y:Float
}

// T2
struct Line {
    var startPoint:Coordinate
    var endPoint:Coordinate
    func length() -> Float {
        var deltax = startPoint.x - endPoint.x
        var deltay = startPoint.y - endPoint.y
        var dis = sqrt(deltax*deltax + deltay*deltay)
        return dis
    }
}

// T3
let pointA = Coordinate(x: 1, y: 2)
let pointB = Coordinate(x: 3, y: 6)
let lineAB = Line(startPoint: pointA, endPoint: pointB)
print(lineAB.length())

// T4
enum stateOfWashingMachine : String {
    case ready
    case inwater
    case wash
    case outwater
    case dry
}

class WashingMachine {
    var brand=""
    var isOn=true
    var state=stateOfWashingMachine.dry
    
    func description(){
        if isOn == true {
            print("Brand : " + brand + "\n")
            print("State : " + state.rawValue + "\n")
        } else {
            print("WARNING : The WashingMachine is OFF!\n")
        }
    }
}

// T5
var myWashingMachine = WashingMachine()
myWashingMachine.brand = "Midea"
myWashingMachine.isOn = false
myWashingMachine.state = stateOfWashingMachine.outwater
myWashingMachine.description()
