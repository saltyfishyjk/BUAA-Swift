import UIKit
func theDayOfTheYear(year : Int, month : Int, day : Int) -> Int {
    var isRun:Int = 0
    if (year % 400 == 0 ) {
        isRun = 1
    } else if (year % 4 == 0 && year % 100 != 0) {
        isRun = 1
    }
    var ans:Int = 0
    if (month == 1) {
        ans = day
    } else {
        if (month > 1) {
            ans += 31
        }
        if (month > 2) {
            if (isRun == 1) {
                ans += 29
            } else {
                ans += 28
            }
        }
        if (month > 3) {
            ans += 31
        }
        if (month > 4) {
            ans += 30
        }
        if (month > 5) {
            ans += 31
        }
        if (month > 6) {
            ans += 30
        }
        if (month > 7) {
            ans += 31
        }
        if (month > 8) {
            ans += 31
        }
        if (month > 9) {
            ans += 30
        }
        if (month > 10) {
            ans += 31
        }
        if (month > 11) {
            ans += 30
        }
        ans += day
    }
    return ans
}
