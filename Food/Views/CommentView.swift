//
//  CommentView.swift
//  BUAASCSE
//

import Foundation
import SwiftUI
import UIKit

struct CommentView: View {
    var comment:Comment
    @EnvironmentObject var userData:UserData
    
    var userName : String {
        self.userData.users.filter { $0.id == comment.userId }[0].name
    }
    
    var body: some View {
        VStack{
            ZStack {
                comment.commentImage
                    .resizable()
                    .frame(width: 100 , height: 100)
                    .cornerRadius( 15 )
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .zIndex(5.0)
                
                
            }.edgesIgnoringSafeArea(.top)
            
    
            
            Text("\(userName)")
            
            Text("\(comment.content)")
        }
    }
}
