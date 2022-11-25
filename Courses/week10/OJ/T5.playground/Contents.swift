import UIKit

func fractionSum(n : Int) -> String {
    var ans:Double = 0.0
    if (n % 2 == 0) {
        for i in 1...(n/2) {
            ans += 1.0 / (Double)(i*2)
        }
        // 偶数
    } else {
        for i in 1...((n+1)/2) {
            ans += 1.0 / (Double)(i*2 - 1)
        }
    }
    return String(format: "%.3f", ans)
}

fractionSum(n: 3)
