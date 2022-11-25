import UIKit
import Foundation

func compare3Numbers(x:Int,y:Int,z:Int) -> (max:Int,mid:Int,min:Int) {
    var maxInt : Int = max(x,y,z)
    var minInt : Int = min(x,y,z)
    var mid : Int = x + y + z - maxInt - minInt
    return (maxInt, mid, minInt)
}

