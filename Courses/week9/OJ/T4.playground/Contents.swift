import UIKit
import Foundation

func sumOfFractionSeries(n :Int) -> String {
    var fenzi : Int = 2
    var fenmu : Int = 1
    var cnt : Int = 1
    var ans : Double = 0.0
    while (cnt <= n) {
        ans += ((Double)(fenzi) / (Double)(fenmu))
        var temp : Int = fenmu
        fenmu = fenzi
        fenzi += temp
        cnt += 1
    }
    return String(format:"%.3f", ans)
}

var ans : String = sumOfFractionSeries(n: 3)
