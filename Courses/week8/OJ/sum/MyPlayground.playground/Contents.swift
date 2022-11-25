import UIKit

func sumOfA(a:Int, numOfTerms:Int)->Int {
    var cnt:Int
    var ans:Int
    var cur:Int
    cnt = 1
    ans = 0
    cur = a
    while (cnt <= numOfTerms) {
        cnt += 1
        ans += cur
        cur = cur * 10 + a
    }
    return ans
}

var t = sumOfA(a: 1, numOfTerms: 3)

