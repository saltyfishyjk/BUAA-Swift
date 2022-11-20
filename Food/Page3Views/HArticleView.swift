//
//  HArticleView.swift
//  BUAASCSE
//

import Foundation
import SwiftUI
struct HArticleListView: View {
    @EnvironmentObject var userData:UserData
    @State var hero = false
    @State var data:[Article]
    
    let onCommentFinished: (Bool) -> Void
    
    var body: some View {
        
            VStack(spacing: 100) {
                ForEach(0..<self.data.count){i in
                    GeometryReader{g in
                        HOurPicks(card: self.$data[i], hero: self.$hero){ ttt in
                            onCommentFinished(self.hero)
                        }
                        
                            .offset(y: self.data[i].isStared ? -g.frame(in: .global).minY : 0)
                            .opacity(self.hero ? (self.data[i].isStared ? 1 : 0) : 1)
                            .onTapGesture {
                                
                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                    if !self.data[i].isStared{
                                        self.hero.toggle()
                                        self.data[i].isStared.toggle()
                                        onCommentFinished(self.hero)
                                    }
                                }
                                
                            }
                        
                    }
                    // going to increase height based on expand...
                    .frame(height: self.data[i].isStared ? UIScreen.main.bounds.height : 250)
                  
                }
            
            
        }
        
   }

    

}
struct HArticleListView2: View {
    @EnvironmentObject var userData:UserData
    @State var hero = false
    @State var data:[Article]
    
    let onCommentFinished: (Bool) -> Void
    
    var body: some View {
        
            VStack(spacing: 100) {
                ForEach(0..<self.data.count){i in
                    GeometryReader{g in
                        HOurPicks(card: self.$data[i], hero: self.$hero){ ttt in
                            onCommentFinished(self.hero)
                        }
                        
                            .offset(y: self.data[i].isStared ? -g.frame(in: .global).minY : 0)
                            .opacity(self.hero ? (self.data[i].isStared ? 1 : 0) : 1)
                            .onTapGesture {
                                
                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                    if !self.data[i].isStared{
                                        self.hero.toggle()
                                        self.data[i].isStared.toggle()
                                        onCommentFinished(self.hero)
                                    }
                                }
                                
                            }
                        
                    }
                    // going to increase height based on expand...
                    .frame(height: self.data[i].isStared ? UIScreen.main.bounds.height : 250)
                   
                
                }.padding(.top,20)
            
        }
        
   }

    

}

struct HOurPicks: View {
    @EnvironmentObject var userData:UserData
    @Binding var card : Article
    //var card : Article
    @Binding var hero : Bool
    @State var heart = "heart.fill"
    
    @State var commentSheet = false
    
    let onCommentFinished: (Bool) -> Void
    
    var body: some View {
        VStack {
            //ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    Image(card.image)
                        .resizable()
                        .frame(width: self.card.isStared ? (UIScreen.main.bounds.width) : (UIScreen.main.bounds.width)*0.9 , height: self.card.isStared ? (UIScreen.main.bounds.height)*0.3 : (UIScreen.main.bounds.height)*0.25 )
                        .cornerRadius(self.card.isStared ? 5 : 20)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .zIndex(5.0)
                    
                    
                }.edgesIgnoringSafeArea(.top)
                
                
                
                HStack{
                    VStack{
                        HStack {
                            Text(card.title)
                                .bold()
                                .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            Spacer()
                        }
                        .padding(.leading, self.card.isStared ? 10 : 20)
                        
                        HStack {
                            Text(card.date)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.leading, self.card.isStared ? 20 : 30)
                            Spacer()
                        }
                        
                        HStack {
                            ForEach(0 ..< card.stars) { item in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.subheadline)
                            }
                            Spacer()
                            
                        }
                        .padding(.bottom, 30)
                        .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(.trailing, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(.leading, self.card.isStared ? 10 : 20)
                        .padding(.trailing, self.card.isStared ? 10 : 20)
                        
                    }
                    if (self.card.isStared) {
                        HStack{
                            Spacer()
                            Button(action: {
                                //print("pressssssed")
                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                    
                                    
                                    self.card.isStared.toggle()
                                    self.hero.toggle()
                                    onCommentFinished(self.hero)
                                }
                                
                            },label:{
                                
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black.opacity(0.8))
                                    .clipShape(Circle())
                                
                                
                            })
                        }.frame(width: 30)
                        
                            .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .padding(.trailing,30)
                        
                        
                    }
                }
                
                if self.card.isStared {
                    VStack{
                        HStack {
                            
                                Text("简介")
                                    .font(.title)
                                    .bold()
                                    .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            
                            Spacer()
                            
                            Button(action: {
                                withAnimation(.spring(dampingFraction: 0.5)) {
                                    if self.userData.prefers[self.card.id].likedUserId.contains(self.userData.userId){
                                        let t = self.userData.prefers[self.card.id].likedUserId.firstIndex(where: {$0 == self.userData.userId})!
                                        self.userData.prefers[self.card.id].likedUserId.remove(at: t)
                                        
                                        let encoder = JSONEncoder()
                                        do  {
                                            // 将player对象encod（编码）
                                            let data: Data = try encoder.encode(self.userData.prefers)
                                            let filename = getDocumentsDirectory().appendingPathComponent("Article.json")
                                            try? data.write(to: filename)
                                        } catch {
                                            
                                        }
                                        
                                    } else {
                                        self.userData.prefers[self.card.id].likedUserId.append(self.userData.userId)
                                        let encoder = JSONEncoder()
                                        do  {
                                            // 将player对象encod（编码）
                                            let data: Data = try encoder.encode(self.userData.prefers)
                                            let filename = getDocumentsDirectory().appendingPathComponent("Article.json")
                                            try? data.write(to: filename)
                                        } catch {
                                            
                                        }
                                    }}
                            })
                            {
                                        
                                if self.userData.prefers[self.card.id].likedUserId.contains(self.userData.userId) {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(Color.red)
                                        .font(.title)
                                } else {
                                    
                                    Image(systemName: "heart").foregroundColor(Color.red).font(.title)}}
                            .padding(9)
                            
                            Button(action: {
                                withAnimation(.spring(dampingFraction: 0.5)) {
                                    if self.userData.prefers[self.card.id].staredUserId.contains(self.userData.userId){
                                        let t = self.userData.prefers[self.card.id].staredUserId.firstIndex(where: {$0 == self.userData.userId})!
                                        self.userData.prefers[self.card.id].staredUserId.remove(at: t)
                                        
                                        let encoder = JSONEncoder()
                                        do  {
                                            // 将player对象encod（编码）
                                            let data: Data = try encoder.encode(self.userData.prefers)
                                            let filename = getDocumentsDirectory().appendingPathComponent("Article.json")
                                            try? data.write(to: filename)
                                        } catch {
                                            
                                        }
                                    } else {
                                        self.userData.prefers[self.card.id].staredUserId.append(self.userData.userId)
                                        let encoder = JSONEncoder()
                                        do  {
                                            // 将player对象encod（编码）
                                            let data: Data = try encoder.encode(self.userData.prefers)
                                            let filename = getDocumentsDirectory().appendingPathComponent("Article.json")
                                            try? data.write(to: filename)
                                        } catch {
                                            
                                        }
                                    }}
                            })
                            {
                                        
                                if self.userData.prefers[self.card.id].staredUserId.contains(self.userData.userId) {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color.yellow)
                                        .font(.title)
                                } else {
                                    
                                    Image(systemName: "star").foregroundColor(Color.yellow).font(.title)}}
                            .padding(15)
                            
                            
                            
                            
                            
                            Button(action: { self.commentSheet=true }, label: {
                                VStack{
                                    Image(systemName: "tray.and.arrow.up")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color.blue.opacity(0.85))
                                    //.padding(10)
                                    Text("评论")
                                        .foregroundColor(Color.blue.opacity(0.85))
                                        .font(.system(size: 17))
                                }
                            })
                            .padding(.trailing, 30)
                            .sheet(isPresented: self.$commentSheet, content:
                                    {
                                WriteCommentView(card:self.card){ text in
                                            print("\(text)")
                                }
                                    }
                            )
                                
                        }
                        ScrollView(.vertical, showsIndicators: false) {
                            Text(card.context)
                                .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        }.frame(height: 100)
                        
                        
                        
                        
                        CommentListView(card:self.card)
                        
                    }
                }
            }
    }
}
