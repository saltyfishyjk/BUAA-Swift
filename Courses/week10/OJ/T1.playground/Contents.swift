import UIKit
import Foundation

func Summation(a : Int, b : Int, c : Int) -> String {
    if (a + b == c) {
        return "Yes"
    } else if (a + c == b) {
        return "Yes"
    } else if (b + c == a) {
        return "Yes"
    } else {
        return "No"
    }
}
 
