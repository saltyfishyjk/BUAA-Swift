import UIKit

func count(n : Int, x : Int) -> Int {
    var cnt:Int = 0
    for index in 1...n {
        var temp:Int = index
        while (temp > 0) {
            if (temp % 10 == x) {
                cnt += 1
            }
            temp /= 10
        }
    }
    return cnt
}

count(n: 11, x: 1)
