import UIKit

func numberReversed(number : Int64) -> String {
    var s : String = ""
    var temp : Int64 = number
    while (temp > 0) {
        s.append("\(temp%10)")
        temp /= 10
    }
    return s
}

numberReversed(number: 1000)
