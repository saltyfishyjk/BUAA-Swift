import UIKit

// Part 1 Class
// T1
class Vehicle {
    var use : String
    var speed : Float
    var producer : String
    var usedYear : Float
    var basicInfo : String {
        get {
            return use + " \(speed) " + producer + " \(usedYear)"
        }
    }
    
    init() {
        self.use = "transport"
        self.speed = 100.0
        self.producer = "BWM"
        self.usedYear = 0.0
    }
    
    init(use : String, speed : Float, producer : String, usedYear : Float) {
        self.use = use
        self.speed = speed
        self.producer = producer
        self.usedYear = usedYear
    }
    
    func description() {
        print(basicInfo)
    }
}

var train : Vehicle = Vehicle(use: "Train Transport", speed: 155.5, producer: "China Train Company", usedYear: 8.8)

train.description()

// T2
class Car : Vehicle {
    var owner : String
    var license : String
    
    override init() {
        self.owner = "JK.Y"
        self.license = "Y2721"
        super.init()
    }
    
    override init(use: String, speed: Float, producer: String, usedYear: Float) {
        self.owner = "default owner"
        self.license = "default license"
        super.init(use: use, speed: speed, producer: producer, usedYear: usedYear)
    }
    
    convenience init(use: String, speed: Float, producer: String, usedYear: Float, owner : String, license : String) {
        self.init(use: use, speed: speed, producer: producer, usedYear: usedYear)
        self.owner = owner
        self.license = license
    }
    
    func propertyTrasnsfer(newOwner : String) {
        self.owner = newOwner
    }
    
    override func description() {
        print(use + " \(speed) " + producer + " \(usedYear) " + owner + " " + license)
    }
    
    override var usedYear: Float {
        didSet {
            print("usedYear is set from \(oldValue) to \(usedYear)")
        }
        willSet {
            print("usedYear will be set to \(newValue)")
        }
    }
    
    convenience init(newCar : Car) {
        self.init()
        self.use = newCar.use
        self.speed = newCar.speed
        self.usedYear = newCar.usedYear
        self.producer = newCar.producer
        self.owner = newCar.owner
        self.license = newCar.license
    }
}

var myCar : Car = Car(use: "Car", speed: 333.33, producer: "Audi", usedYear: 2.2, owner: "JK.Y", license: "J2721")

myCar.description()
myCar.propertyTrasnsfer(newOwner: "ZH.L")
myCar.description()

// T3
func annualInspection(veh : Vehicle) -> Bool {
    if (veh.usedYear > 5) {
        return true
    } else {
        return false
    }
}

print(annualInspection(veh: train))
print(annualInspection(veh: myCar))

// T4
// completed in T2

// T5
// completed in T2

// T6
// completed in T2
myCar.usedYear = 8.8

// T7
// completed in T1 & T2

// T8
// completed in T1 & T2

// T9
// completed in T1 & T2
var myCar2 : Car = Car(use: "fun", speed: 2.2, producer: "Audi", usedYear: 2.2, owner: "Jack", license: "19191")
var hisCar : Car = Car(newCar: myCar2)

// Part 2 Text
// T1
protocol Ownership {
    var owner:String{get set}
    var registerDate:String{get set}
    var serialNo:Int{get set}
    func updateOwnerShip(newOwner:String, newRegisterDate:String)
}

// T2
protocol VehiclePro {
    var license:String{get set}
    var producer:String{get set}
    var speed:Double{get set}
    var hour:Int{get set}
    associatedtype UnKnownType
    var weight:UnKnownType{get set}
    var distance:Double{get set}
    func movingVehicle(newHour:Int)
}

// T3
class CarClass : Ownership, VehiclePro {
    var license: String
    
    var producer: String
    
    var speed: Double
    
    var hour: Int
    
    var weight: Double
    
    var distance: Double
    
    func movingVehicle(newHour: Int) {
        hour += newHour
    }
    
    typealias UnKnownType = Double
    
    var owner: String
    
    var registerDate: String
    
    var serialNo: Int
    
    func updateOwnerShip(newOwner: String, newRegisterDate: String) {
        owner = newOwner
        registerDate = newRegisterDate
    }
    
    init() {
        license = "No License"
        producer = "No Producer"
        speed = 666.666
        hour = 0
        weight = 1000.99
        distance = 0.0
        owner = "No Owner"
        registerDate = "No Register Date"
        serialNo = 0
    }
    
    init(license:String, producer:String, speed:Double, hour:Int, weight:Double, distance:Double, owner:String, registerDate:String, serialNo:Int) {
        self.license = license
        self.producer = producer
        self.speed = speed
        self.hour = hour
        self.weight = weight
        self.distance = distance
        self.owner = owner
        self.registerDate = registerDate
        self.serialNo = serialNo
    }
}

// T4
var myCarObj:CarClass = CarClass(license: "Legal License", producer: "Audi", speed: 233.33, hour: 0, weight: 1000.00, distance: 0.0, owner: "JK.Y", registerDate: "2022/10/30", serialNo: 0)
myCarObj.movingVehicle(newHour: 800)
myCarObj.updateOwnerShip(newOwner: "ZH.L", newRegisterDate: "2022/10/31")

// T5

protocol Ownership2 {
    func updateOwnerShip(newOwner:String, newRegisterDate:String)
}

protocol VehiclePro2 {
    func movingVehicle(newHour:Int)
}

class CarClass2 {
    var license: String
    
    var producer: String
    
    var speed: Double
    
    var hour: Int
    
    var weight: Double
    
    var distance: Double
    
    var owner: String
    
    var registerDate: String
    
    var serialNo: Int
    
    init() {
        license = "No License"
        producer = "No Producer"
        speed = 666.666
        hour = 0
        weight = 1000.99
        distance = 0.0
        owner = "No Owner"
        registerDate = "No Register Date"
        serialNo = 0
    }
    
    init(license:String, producer:String, speed:Double, hour:Int, weight:Double, distance:Double, owner:String, registerDate:String, serialNo:Int) {
        self.license = license
        self.producer = producer
        self.speed = speed
        self.hour = hour
        self.weight = weight
        self.distance = distance
        self.owner = owner
        self.registerDate = registerDate
        self.serialNo = serialNo
    }
    
}
extension CarClass2 : Ownership2, VehiclePro2 {
    func updateOwnerShip(newOwner: String, newRegisterDate: String) {
        self.owner = newOwner
        self.registerDate = newRegisterDate
    }
    func movingVehicle(newHour: Int) {
        self.hour += newHour
    }
}

var myCarObj2:CarClass2 = CarClass2(license: "Legal License", producer: "Audi", speed: 233.33, hour: 0, weight: 1000.00, distance: 0.0, owner: "JK.Y", registerDate: "2022/10/30", serialNo: 0)
myCarObj2.movingVehicle(newHour: 800)
myCarObj2.updateOwnerShip(newOwner: "ZH.L", newRegisterDate: "2022/10/31")

// Part 3 <T>
// T1
func swap2Element<T1,T2>(a : inout T1, b : inout T2) -> (T2, T1) {
    return(b, a)
}
var a:Int = 33
var b:String = "Jay"
swap2Element(a: &a, b: &b)

// T2
class Person<T1, T2> {
    var name:String
    var weight:T1
    var height:T2
    
    init(name:String, weight:T1, height:T2) {
        self.name = name
        self.weight = weight
        self.height = height
    }
    
    func description () {
        print("name : \(self.name)")
        print("weight : \(self.weight)")
        print("height : \(self.height)")
    }
}

var Jennie:Person<Int, Int> = Person(name: "Jennie", weight: 45, height: 160)
Jennie.description()

var Jack:Person<Double, Int> = Person(name:"Jack", weight: 69.2, height: 173)
Jack.description()

var Sam:Person<Double, String> = Person(name:"Sam", weight: 88.8, height: "UnKnown")
Sam.description()
