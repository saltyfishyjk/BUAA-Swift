import UIKit
import Foundation

func primeList(startNumber : Int, endNumber : Int)->Int {
    var cnt : Int = 0
    for index in startNumber...endNumber {
        if (index == 2) {
            cnt += 1
            continue
        }
        var flag : Bool = true
        for j in 2...(index - 1) {
            if (index % j == 0) {
                flag = false
                break
            }
        }
        if (flag) {
            cnt += 1
        }
    }
    return cnt
}

primeList(startNumber: 3, endNumber: 15)
