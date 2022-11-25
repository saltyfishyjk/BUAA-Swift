import UIKit
/* ------------ Array Part ------------ */
// T1
var majorCompusoryCourse = [String]()
majorCompusoryCourse.append("DS")
majorCompusoryCourse.append("CO")
majorCompusoryCourse.append("CN")
var majorOptionalCourse : [String] = ["iOS", "Swift", "AI"]
var generalCourse = [String](repeating: "music", count: 1)
generalCourse.append("art")
generalCourse.append("literature")

// T2
var course = [String]()
course = course + majorCompusoryCourse + majorOptionalCourse + generalCourse

// T3
course.removeFirst()
course.append("mobile")
course.remove(at: 6)

// T4
for (index, c) in course.enumerated() {
    print(String(index) + " " + c)
}

// T5
let courseSlice = course[3...6]
var newCourse = Array(courseSlice)
print(type(of: courseSlice))
print(type(of: newCourse))

// T6
newCourse.sort()
print(newCourse)

/* ---------- Set Part ---------- */
// T1
var gradeOfTheory = Set<String>()
if !gradeOfTheory.isEmpty {
    print("Not Empty")
} else {
    gradeOfTheory.insert("Fail")
    gradeOfTheory.insert("Pass")
    gradeOfTheory.insert("Common")
    gradeOfTheory.insert("Good")
    gradeOfTheory.insert("Excellent")
}

// T2
var gradeOfExperiment = gradeOfTheory
gradeOfExperiment.remove("Common")
gradeOfExperiment.remove("Good")
gradeOfExperiment.remove("Excellent")
if gradeOfExperiment.contains("Fail") && gradeOfExperiment.contains("Pass") {
    print("Got Fail and Pass!")
}

// T3
gradeOfTheory.sorted()
gradeOfExperiment.sorted()
for grade in gradeOfTheory {
    print(grade)
}
for grade in gradeOfExperiment {
    print(grade)
}

// T4
var intersectGroup = gradeOfTheory.intersection(gradeOfExperiment)
var unionGroup = gradeOfTheory.union(gradeOfExperiment)
var substractGroup = gradeOfTheory.subtracting(gradeOfExperiment)
print("interact : ")
print(intersectGroup)
print("union : ")
print(unionGroup)
print("subtract : ")
print(substractGroup)
print(gradeOfTheory)
gradeOfTheory.subtract(gradeOfExperiment)
print(gradeOfTheory)
// 区别：subytracting创建操作后的新集合，subtract直接操作原集合

/* ---------- Dictionary --------- */
// T1
var colleges = [1:"c1", 2:"c2", 3:"c3", 4:"c4", 5:"c5", 6:"c6"]

// T2
colleges[3]="revisedSchool"
colleges.updateValue("updatedSchool", forKey: 4)
print(colleges)

// T3
colleges[7] = "Mechanism"
colleges[8] = "Management"

// T4
for (index, college) in colleges {
    print("index : \(index) college : \(college)")
}

/* ---------- control --------- */
var sum = 0
for i in 1...100 {
    sum += i
}
print(sum)

// T2
var sum2 = 0
var cnt = 1
while cnt <= 100 {
    sum2 += cnt
    cnt += 1
}
print(sum2)

var sum3 = 0
cnt = 1
repeat {
    sum3 += cnt
    cnt += 1
} while cnt <= 100
print(sum3)

// T3
var score = 100
if score < 60 {
    print("Fail")
} else if score < 70 {
    print("Pass")
} else if score < 80 {
    print("Common")
} else if score < 90 {
    print("Good")
} else {
    print("Excellent")
}

// T4
switch score {
case 0...59 : var grade = "Fail"
    print(grade)
case 60...69 : var grade = "Pass"
    print(grade)
case 70...79 : var grade = "Common"
    print(grade)
case 80...89 : var grade = "Good"
    print(grade)
case 90...100 : var grade = "Excellent"
    print(grade)
default : print("More than 100")
}

// T5
var subject = "Math"
var grade = "Excellent"
var subjectInfo =  (grade, subject)

switch subjectInfo {
case ("Fail", _) : print("Fail")
case ("Pass", _) : print("Pass")
case ("Excellent", "Math") : print("Excellent in Math")
case ("Excellent", "Physics") : print("Excellent in Physics")
default : print("Fail to match")
}
