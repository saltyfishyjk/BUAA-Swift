import UIKit

func dividedWithoutRemainder(number : Int, divider : Int) -> Int {
    var a : Int = number
    var b : Int = divider
    var cnt : Int = 0
    while (a % b == 0) {
        a /= b
        cnt += 1
    }
    return cnt
}
