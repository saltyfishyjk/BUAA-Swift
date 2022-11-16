//
//  Comment.swift
//  SCSE
//
//  Created by YJK on 2022/11/16.
//

import Foundation
import SwiftUI
import CoreLocation

// 文章评论，在文章下面所附
struct Comment:Hashable, Codable, Identifiable {
    var id:Int // 评论的id
    var user:User // 发表评论的User
    var articleId:Int // 评论所在的文章的id
    var content:String // 评论正文内容
    var commentImageName:String // 评论所附图片
    
    init(user: User, id: Int, articleId: Int, content: String, commentImageName: String) {
        self.user = user
        self.id = id
        self.articleId = articleId
        self.content = content
        self.commentImageName = commentImageName
    }
}
