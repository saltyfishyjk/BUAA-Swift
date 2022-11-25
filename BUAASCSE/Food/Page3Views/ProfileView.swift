//
//  ProfileView.swift
//  BUAASCSE
//
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userData: UserData
    @State var hero1=false
    @State var hero2=false
   
    func refresh(){
        
        let encoder = JSONEncoder()
        do  {
            // 将player对象encod（编码）
            let data: Data = try encoder.encode(self.userData.issues)
            let filename = getDocumentsDirectory().appendingPathComponent("Issue.json")
            try? data.write(to: filename)
        } catch {
            
        }
    
        do  {
            // 将player对象encod（编码）
            let data: Data = try encoder.encode(self.userData.comments)
            let filename = getDocumentsDirectory().appendingPathComponent("Comment.json")
            try? data.write(to: filename)
        } catch {
            
        }
  
        do  {
            // 将player对象encod（编码）
            let data: Data = try encoder.encode(self.userData.users)
            let filename = getDocumentsDirectory().appendingPathComponent("UserInfo.json")
            try? data.write(to: filename)
        } catch {
            
        }
        
        do  {
            // 将player对象encod（编码）
            let data: Data = try encoder.encode(self.userData.prefers)
            let filename = getDocumentsDirectory().appendingPathComponent("Atricle.json")
            try? data.write(to: filename)
        } catch {
            
        }
    }
    
    
    var userName : String {
        self.userData.users.filter { $0.id == userData.userId }[0].name
    }
    
    var body: some View {
        VStack{
            
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    Text("Hello," + userName)
                        .bold()
                        .font(.largeTitle)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.blue)
                        .padding(.leading, 20)
                        .padding(.top, -40)
                    Spacer()
                }
                HStack {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                        .font(.title)
                        .padding(.leading, 20)
                    Text("点赞")
                        .bold()
                        .font(.title)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.trailing)
                        //.padding(.leading, 20)
                        .zIndex(1.0)
                        .opacity((self.hero1 || self.hero2) ? 0 : 1)
                    Spacer()
                }
                HArticleListView(data: self.userData.articles.filter { self.userData.prefers[$0.id].likedUserId.contains(self.userData.userId) } ){ i in
                    hero1.toggle()
                    
                } .opacity((self.hero2) ? 0 : 1)
                    .zIndex(5.0)
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.title)
                        .padding(.leading, 20)
                        .padding(.top, 80)
                    Text("收藏")
                        .bold()
                        .font(.title)
                        .foregroundColor(.yellow)
                        .multilineTextAlignment(.trailing)
                        //.padding(.leading, 20)
                        .padding(.top, 80)
                        .zIndex(1.0)
                        .opacity((self.hero1 || self.hero2) ? 0 : 1)
                    Spacer()
                }
                HArticleListView2(data: self.userData.articles.filter { self.userData.prefers[$0.id].staredUserId.contains(self.userData.userId) } ) { i in
                    hero2.toggle()
                } .opacity((self.hero1) ? 0 : 1)
                    
                       .zIndex(5.0)
                
            }
            
        }
    }
}
