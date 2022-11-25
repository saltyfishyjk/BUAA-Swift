import UIKit
import Foundation

func sumOfFactorial(n : Int) -> Int {
    var sum:Int = 0
    for index in 1...n {
        var temp:Int = 1
        for j in 1...index {
            temp *= j
        }
        sum += temp
    }
    return sum
}
