//
//  User.swift
//  BUAASCSE
//

import Foundation

// 用户信息结构体

struct User:Hashable, Codable, Identifiable {
    var id:Int
    var number:String // 学工号，可能包含字母和数字
    var password:String // 密码，是一个字符串
    var role:Int // 角色 0 : superadmin, 1:admin, 2:user
    var name:String // 名字
    var progress:String
}
