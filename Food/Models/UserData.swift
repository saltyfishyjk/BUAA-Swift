//
//  UserData.swift
//  BUAASCSE
//
//  Created by YJK on 2022/11/16.
//

import Foundation
import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var hasInit = ddd
    @Published var users = userInfoData // 用户数组
    @Published var articles = articleData // 新闻数组
    @Published var comments = commentData
    @Published var issues = issueData
    @Published var prefers = preferData
    
    
    @Published var userId = 1
    
    
}
