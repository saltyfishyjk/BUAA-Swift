//
//  UserPreference.swift
//  BUAASCSE
//

import Foundation
struct UserPreference : Hashable, Codable, Identifiable {
    var id:Int
    var likedUserId:[Int]=[]
    var staredUserId:[Int]=[]
}
