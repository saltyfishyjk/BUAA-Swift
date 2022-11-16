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
    @Published var users = userData // 用户数组
    @Published var articles = articleData // 新闻数组
    
    
}
