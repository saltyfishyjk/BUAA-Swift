import UIKit

func JudgePalindrome(number : Int64) {
    var nums = [Int64]()
    var temp : Int64 = number
    var len : Int = 0
    while (temp > 0) {
        nums.append(temp % 10)
        temp /= 10
        len += 1
    }
    temp = number
    var cnt : Int = 0
    var flag : Bool = true
    
    while (temp > 0) {
        if (nums[len - cnt - 1] != (temp % 10)) {
            print("No")
            flag = false
            break
        }
        temp /= 10
        cnt += 1
    }
    if (flag) {
        print("Yes")
    }
}

JudgePalindrome(number: 889)
