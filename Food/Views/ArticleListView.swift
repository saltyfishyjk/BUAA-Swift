//
//  ArticleListView.swift
//  BUAASCSE
//

import Foundation
import SwiftUI
struct ArticleListView: View {
    @EnvironmentObject var userData:UserData
    @State var hero = false
    @State var data:[Article]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 100) {
                ForEach(0..<self.data.count){i in
                    GeometryReader{g in
                        OurPicks(card: self.$data[i], hero: self.$hero)
                        
                            .offset(y: self.data[i].isStared ? -g.frame(in: .global).minY : 0)
                            .opacity(self.hero ? (self.data[i].isStared ? 1 : 0) : 1)
                            .onTapGesture {
                                
                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                    if !self.data[i].isStared{
                                        self.hero.toggle()
                                        self.data[i].isStared.toggle()
                                    }
                                }
                                
                            }
                        
                    }
                    // going to increase height based on expand...
                    .frame(height: self.data[i].isStared ? UIScreen.main.bounds.height : 250)
                    .simultaneousGesture(DragGesture(minimumDistance: self.data[i].isStared ? 0 : 800).onChanged({ (_) in
                        
                        print("dragging")
                    }))
                }
            }
            
        }
        
   }

    

}

