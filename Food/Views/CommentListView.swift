//
//  CommentListView.swift
//  Food
//
//  Created by jinshenghao on 2022/11/18.
//

import Foundation
import SwiftUI

struct CommentListView : View {
    
    @EnvironmentObject var userData:UserData
    
    @State var card:Article
    
    var body: some View{
        
        //List {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0) {
                
                ForEach(self.userData.comments.filter {$0.articleId == card.id} ) { comment in
                    NavigationLink(
                        destination: CommentView(
                            comment: comment
                        )
                    ) {
                        HStack {
                            CommentListItem(comment:comment)
                                .padding()
                            Spacer()
                            
                            
                        }.padding()
                        
                        // }
                    }}
            }}
            

       // }.frame(height: 400)
        
        
        
        
    }
}

struct CommentListItem : View {
    var comment:Comment
    @EnvironmentObject var userData:UserData
    
    var userName : String {
        self.userData.users.filter { $0.id == comment.userId }[0].name
    }
    
    var body: some View {
        //Text(comment.title)
        HStack{
            picItem(comment:comment)
            VStack{
                Text(userName)
                Text(comment.content)
            }
            
            
        }
    }
    
}

struct picItem: View {
    var comment:Comment
    
    var body: some View {
        VStack(alignment: .leading) {
            comment.commentImage
                .renderingMode(.original)
                .resizable()
                .frame(width: 55, height: 55)
                .cornerRadius(5)
            
        }
        .padding(.leading, 15)
        
    }
}

