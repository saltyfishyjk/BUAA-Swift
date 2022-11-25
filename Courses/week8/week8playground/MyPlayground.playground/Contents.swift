import UIKit
import Foundation

// ---------- Attribute ----------
// T1
struct Circle {
    let pi : Float = 3.1415926
    var a : Float
    var area : Float {
        get {
            return pi * a * a
        }
        set {
            a = sqrt(newValue / pi)
        }
    }
}
var smallCircle = Circle(a: 6)
print("smallCircle's area : \(smallCircle.area)")

var bigCircle:Circle = Circle(a:0)
bigCircle.area = 10000.0
print("bigCircle's r : \(bigCircle.a)")

// T2
struct Car {
    var carNumber:String
    var brand:String
    var ownerName:String
}

var car:Car = Car(carNumber: "Y2721", brand: "BMW", ownerName: "JK.Y")
print("Car number : \(car.carNumber) \nCar brand : \(car.brand) \nCar ownerName : \(car.ownerName)")
car.ownerName = "ZH.L"
print("Car number : \(car.carNumber) \nCar brand : \(car.brand) \nCar ownerName : \(car.ownerName)")

// T3
struct GamePlayer {
    static var highestScore:Int = 36690
    var playerName:String
    var playerId:Int
    var curP:Int
    var curScore:Int
    var curTotal:Int
}

var player1:GamePlayer = GamePlayer(playerName: "JK.Y", playerId: 66660001, curP: 2, curScore: 876, curTotal: 1876)
var player2:GamePlayer = GamePlayer(playerName: "ZH.L", playerId: 66660002, curP: 5, curScore: 6690, curTotal: 1000+9000+10000*2+6690)
print("player1 total score : \(player1.curTotal)")
print("player2 total score : \(player2.curTotal)")
print("Now highest score \(GamePlayer.highestScore)")


// ---------- Method ----------
// T1
struct basketballPlayer {
    var name:String
    var ball3:Int
    var ball2:Int
    var score:Int {
        get {
            return ball3 * 3 + ball2 * 2
        }
    }
    func output() {
        print("Name : \(self.name)\nball3 : \(self.ball3)\nball2 : \(self.ball2)")
    }
}

// T2
class basketballTeam {
    var name:String = ""
    var players=[basketballPlayer]()
    var score:Int {
        get {
            var cnt:Int=0
            for player in players {
                cnt += player.score
            }
            return cnt
        }
    }
    init(teamName:String) {
        self.name = teamName
    }
    func addPlayer(player:basketballPlayer) {
        self.players.append(player)
    }
    func out() {
        for player in players {
            player.output()
        }
    }
}

// T3
var player11:basketballPlayer = basketballPlayer(name: "Tom", ball3: 2, ball2: 4)
var player22:basketballPlayer = basketballPlayer(name: "Jack", ball3: 9, ball2: 1)
var player33:basketballPlayer = basketballPlayer(name: "Jane", ball3: 5, ball2: 5)
var team:basketballTeam = basketballTeam(teamName: "WAHAHA")
team.addPlayer(player: player11)
team.addPlayer(player: player22)
team.addPlayer(player: player33)

print("team score \(team.score)")
team.out()

// T3
struct ToolSet {
    static func taxPayment(salary:Float) -> Float {
        var ans:Float
        if (salary < 3000.0) {
            ans = salary * 0.03
        } else if (salary < 12000.0) {
            ans = 3000.0 * 0.03 + (salary - 3000.0) * 0.1
        } else if (salary < 25000.0) {
            ans = 3000.0 * 0.03 + (12000.0-3000.0)*0.1 + (salary - 12000.0) * 0.2
        } else {
            ans = 3000.0*0.03 + (12000.0-3000.0)*0.1 + 2600 + (salary-25000.0)*0.3
        }
        return ans
    }
}

var salary:Float=25000.0
print(ToolSet.taxPayment(salary: salary))

struct basketballPlayerAlter {
    var name:String
    var ball3:Int
    var ball2:Int
    var score:Int {
        get {
            return ball3 * 3 + ball2 * 2
        }
    }
    mutating func gainScore (type:Int) {
        if (type == 2) {
            ball2 = ball2 + 1
        } else {
            ball3 += 1
        }
    }
    func output() {
        print("Name : \(self.name)\nball3 : \(self.ball3)\nball2 : \(self.ball2)\nScore : \(self.score)")
    }
}

// T6

class basketballTeamAlter {
    var name:String = ""
    var players=[basketballPlayer]()
    var score:Int {
        get {
            var cnt:Int=0
            for player in players {
                cnt += player.score
            }
            return cnt
        }
    }
    init(teamName:String) {
        self.name = teamName
    }
    func addPlayer(player:basketballPlayer) {
        self.players.append(player)
    }
    func out() {
        for player in players {
            player.output()
        }
    }
    subscript(index:Int) -> basketballPlayer {
        get {
            return players[index]
        }
    }
}

var player111:basketballPlayer = basketballPlayer(name: "Tom", ball3: 2, ball2: 4)
var player222:basketballPlayer = basketballPlayer(name: "Jack", ball3: 9, ball2: 1)
var player333:basketballPlayer = basketballPlayer(name: "Jane", ball3: 5, ball2: 5)
var teams:basketballTeamAlter = basketballTeamAlter(teamName: "WAHAHA")
teams.addPlayer(player: player111)
teams.addPlayer(player: player222)
teams.addPlayer(player: player333)

print("\(teams[1].name)")
