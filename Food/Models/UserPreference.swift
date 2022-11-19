//
//  UserPreference.swift
//  Food
//
//  Created by jinshenghao on 2022/11/18.
//

import Foundation
struct UserPreference : Hashable, Codable, Identifiable {
    var id:Int
    var likedUserId:[Int]=[]
    var staredUserId:[Int]=[]
}
