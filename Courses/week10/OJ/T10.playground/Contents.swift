func circle(num : Int) -> Int {
    return att(num: num) + 1
}

func att(num:Int) -> Int {
    if (num == 1) {
        return 0
    } else {
        return (att(num: num-1) + 3)%num
    }
}

circle(num: 2)
