// Week 2 PlayGround
// Created By YJK on 2022/09/05

import UIKit

// Tuple T1
let studentInfo = (id : 114, name : "JingKaiYu", politicsStatus : "Communist")
// Tuple T2
// Method 1
print(studentInfo.id)
print(studentInfo.name)
print(studentInfo.politicsStatus)
// Method 2
print(studentInfo.0)
print(studentInfo.1)
print(studentInfo.2)
// Method 3
let (id, name, politicsStatus) = studentInfo
print(id)
print(name)
print(politicsStatus)

// Nil T1
var myHobby : String?
myHobby = "KFC Crazy Thursday"
// if one has no hobby
myHobby = nil

// Nil T2
var parseStringToInt = Int("10")
print(type(of: parseStringToInt))
parseStringToInt = Int("Picasso")
print(type(of: parseStringToInt))

// Nil T3
let nameT3 = "Tommy"
var hobby : String?
if hobby == nil {
    print(nameT3)
} else {
    print(nameT3 + hobby!)
}

// Nil T4
var membershsip : String?
membershsip = "IEEE senior member"
if let membership = membershsip {
    print(membership)
} else {
    print("Nil")
}

// Nil T5
hobby = "soccer"
//hobby = nil
if let hobby = hobby, let membershsip = membershsip {
    print("hobby : " + hobby + " membership : " + membershsip)
} else {
    print("Contains nil")
}

// Nil T6
var getHobby : String
var getMembership : String
getHobby = hobby ?? "No hobby"
getMembership = membershsip ?? "No membership"

hobby = nil
membershsip = nil
getHobby = hobby ?? "No hobby"
getMembership = membershsip ?? "No membership"

// String T1
var university = ""
var college = String()

// String T2
if college.isEmpty {
    print("College name is empty !")
} else {
    print(college)
}

// String T3
university = "BUAA"
if university.isEmpty {
    print("University name is empty !")
} else {
    print(university)
}

// String T4
var MyUniversity : String
MyUniversity = university
print(university + " " + MyUniversity)
MyUniversity = "TsingHua University"
print(university + " " + MyUniversity)

// String Operation T1
var myHobbies : String
myHobbies = "eat,sleep,play"
var cnt = 0
for char in myHobbies {
    print(char)
    cnt += 1
}
print(cnt)

// String Operation T2.6
let startIndex = myHobbies.startIndex
let lastIndex = myHobbies.index(before: myHobbies.endIndex)
print(myHobbies[startIndex])
print(myHobbies[lastIndex])

let secondIndexStart = myHobbies.index(myHobbies.startIndex, offsetBy: 5)
print(myHobbies[secondIndexStart])
let secondIndexEnd = myHobbies.index(myHobbies.endIndex, offsetBy: -11)
print(myHobbies[secondIndexEnd])

// String Operation T7
var hobbyIndex1 = myHobbies.firstIndex(of: ",")!
let hobby1 = myHobbies[myHobbies.startIndex..<hobbyIndex1]
var hobbies2 = myHobbies[myHobbies.index(after: hobbyIndex1)...]
let hobbyIndex2 = hobbies2.firstIndex(of: ",")!
let hobby2 = hobbies2[hobbies2.startIndex..<hobbyIndex2]
let hobby3 = hobbies2[hobbies2.index(after: hobbyIndex2)...]

print("hobby1:" + hobby1 + " hobby2:" + hobby2 + " hobnby3:" + hobby3)

// String Operation T8
if hobby1 == hobby2 {
    print("hobby1 equals hobby2")
} else {
    print("hobby1 not equals hobby2")
}

if hobby1.hasPrefix("e") {
    print("hobby1 has prefix e")
} else {
    print("hobby1 does not have prefix e")
}

if hobby2.hasSuffix("eep") {
    print("hobby2 has suffix eep")
} else {
    print("hobby2 does not have suffix eep ")
}
