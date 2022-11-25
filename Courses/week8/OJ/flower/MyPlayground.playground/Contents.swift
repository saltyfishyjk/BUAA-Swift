import UIKit

func daffodil(beginNumber:Int, endNumber:Int) -> Int {
    var index:Int = beginNumber;
    var cnt:Int = 0
    while (index <= endNumber) {
        var hundred:Int = index / 100
        var ten:Int = index / 10 % 10
        var single:Int = index % 10
        if(hundred * hundred * hundred + ten * ten * ten + single * single * single == index) {
            cnt += 1
        }
        index += 1
    }
    return cnt
}

daffodil(beginNumber: 130, endNumber: 166)
