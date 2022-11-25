import UIKit
import Foundation

func perfectNumber(beginNumber : Int, endNumber : Int) -> Int {
    var cnt:Int = 0
    for index in beginNumber...endNumber {
        var sum:Int = 0
        for j in 1...index-1 {
            //print(j)
            if index % j == 0 {
                sum += j
            }
        }
        if sum == index {
            cnt += 1
        }
    }
    return cnt
}

perfectNumber(beginNumber: 6, endNumber: 6)
