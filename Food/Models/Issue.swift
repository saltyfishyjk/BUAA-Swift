//
//  Issue.swift
//  Food
//
//  Created by jinshenghao on 2022/11/16.
//

import Foundation
struct Issue:Hashable, Codable, Identifiable {
    var id:Int
    var type:Int    //  1 2 3 4 对应tab2的四个button
    
    //type1
    var title:String
    var content:String

    
    
}
