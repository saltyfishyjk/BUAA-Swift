import UIKit
func isLegal(name : String) -> String {
    var temp:String = name
    var timur:String = "Timur"
    temp.sorted()
    if (temp.sorted() == timur.sorted()) {
        return "Yes"
    } else {
        return "No"
    }
}

isLegal(name: "miruT")
