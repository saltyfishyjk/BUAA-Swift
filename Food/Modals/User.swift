//
//  User.swift
//  Food
//
//  Created by jinshenghao on 2022/11/12.
//

import Foundation

struct User:Identifiable {
    var id:String // 学工号，可能包含字母和数字
    var password:String // 密码，是一个字符串
    var role:Int // 角色 0 : superadmin, 1:admin, 2:user
}

var Users = [
    User(id: "admin", password: "admin", role: 1)
]
