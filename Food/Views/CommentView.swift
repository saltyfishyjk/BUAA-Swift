//
//  CommentView.swift
//  SCSE
//
//  Created by YJK on 2022/11/16.
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
                    .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
                    .cornerRadius( 5 )
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .zIndex(5.0)
                
                
            }.edgesIgnoringSafeArea(.top)
            
    
            
            Text("\(userName)")
            
            Text("\(comment.content)")
        }
    }
}

/*
struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
*/
