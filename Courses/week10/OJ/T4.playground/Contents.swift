import UIKit

func rightTriangle(a : Int, b : Int, c : Int) -> Int {
    if (a*a + b*b == c*c) {
        return a * b / 2
    } else if (a*a + c*c == b*b) {
        return a * c / 2
    } else if (b*b + c*c == a*a) {
        return b * c / 2
    } else {
        return 0
    }
}
