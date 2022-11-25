import UIKit
import Foundation

func arrangeBonus(profits : Double) -> String {
    var ans : Double = 0.0
    if (profits <= 10.0) {
        ans = profits * 0.1
    } else if (profits <= 20.0) {
        ans = 1.0 + (profits - 10.0) * 0.075
    } else if (profits <= 40.0) {
        ans = 1.0 + 0.75 + (profits - 20.0) * 0.05
    } else if (profits <= 60.0) {
        ans = 1.0 + 0.75 + 1.0 + (profits - 40.0) * 0.03
    } else if (profits <= 100.0) {
        ans = 1.0 + 0.75 + 1.0  + 0.6 + (profits - 60.0) * 0.015
    } else {
        ans = 1.0 + 0.75 + 1.0  + 0.6 + 0.6 + (profits - 100.0) * 0.01
    }
    return String(format: "%.2f", ans)
}

arrangeBonus(profits: 10.0)
