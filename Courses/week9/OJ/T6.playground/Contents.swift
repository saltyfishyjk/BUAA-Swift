import UIKit

func encryptNumbers(originNumber : Int) -> Int {
    var a = originNumber / 1000
    var b = originNumber / 100 % 10
    var c = originNumber / 10 % 10
    var d = originNumber % 10
    
    a = (a + 5) % 10
    b = (b + 5) % 10
    c = (c + 5) % 10
    d = (d + 5) % 10
    return d * 1000 + c * 100 + b * 10 + a
}
