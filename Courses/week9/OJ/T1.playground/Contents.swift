import UIKit

// 2 2 4 6 10
func computeRabbits(length : Int) -> Int {
    var a : Int = 1
    var b : Int = 1
    if (length == 1 || length == 2) {
        return 1
    } else {
        var cnt : Int = 2
        var ans : Int = 1
        while (cnt < length) {
            ans = a + b
            a = b
            b = ans
            cnt += 1
        }
        return ans
    }
}

computeRabbits(length: 5)
