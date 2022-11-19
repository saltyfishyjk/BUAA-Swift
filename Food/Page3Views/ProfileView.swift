//
//  ProfileView.swift
//  Food
//
//  Created by jinshenghao on 2022/11/18.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userData: UserData
    @State var hero1=false
    @State var hero2=false
   
    
    var userName : String {
        self.userData.users.filter { $0.id == userData.userId }[0].name
    }
    
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                Text("hello,\(userName)!")
                    .zIndex(1.0)
                    .opacity((self.hero1 || self.hero2) ? 0 : 1)
                Text("点赞的文章")
                    .zIndex(1.0)
                    .opacity((self.hero1 || self.hero2) ? 0 : 1)
                HArticleListView(data: self.userData.articles.filter { self.userData.prefers[$0.id].likedUserId.contains(self.userData.userId) } ){ i in
                    hero1.toggle()
                    
                } .opacity((self.hero2) ? 0 : 1)
                    .zIndex(5.0)
                
               
                Text("收藏的文章")
                    .opacity((self.hero1 || self.hero2) ? 0 : 1)
                    .zIndex(1.0)
                    .padding(.top,80)
                
                HArticleListView2(data: self.userData.articles.filter { self.userData.prefers[$0.id].staredUserId.contains(self.userData.userId) } ) { i in
                    hero2.toggle()
                } .opacity((self.hero1) ? 0 : 1)
                    
                       .zIndex(5.0)
                
                
            }
            
        }
    }
}

/*
struct UserStaredView: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        HArticleListView(data: self.userData.articles.filter { self.userData.prefers[$0.id].staredUserId.contains(self.userData.userId) } )
        
    }
}

struct UserLikedView: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        HArticleListView(data: self.userData.articles.filter { self.userData.prefers[$0.id].likedUserId.contains(self.userData.userId) } )
        
    }
*/


