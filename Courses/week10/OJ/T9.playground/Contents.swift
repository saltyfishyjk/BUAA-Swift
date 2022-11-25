import UIKit

func threeBitsNumber(n:Int)->Int {
    var cnt:Int = 0
    for index in 111...666 {
        var temp:Int = index
        var one = 0
        var two = 0
        var three = 0
        var four = 0
        var five = 0
        var six = 0
        var flag = 1
        while (temp > 0) {
            if (temp % 10 == 1) {
                if (one == 1) {
                    flag = 0
                    break
                } else {
                    one = 1
                }
            } else if (temp % 10 == 2) {
                if (two == 1) {
                    flag = 0
                    break
                } else {
                    two = 1
                }
            } else if (temp % 10 == 3) {
                if (three == 1) {
                    flag = 0
                    break
                } else {
                    three = 1
                }
            } else if (temp % 10 == 4) {
                if (four == 1) {
                    flag = 0
                    break
                } else {
                    four = 1
                }
            } else if (temp % 10 == 5) {
                if (five == 1) {
                    flag = 0
                    break
                } else {
                    five = 1
                }
            } else if (temp % 10 == 6) {
                if (six == 1) {
                    flag = 0
                    break
                } else {
                    six = 1
                }
            } else {
                flag = 0
                break
            }
            temp /= 10
        }
        if (flag == 1) {
            cnt += 1
        }
        if (cnt == n) {
            return index
        }
    }
    return 0
}

threeBitsNumber(n: 10)
