//
//  Meal.swift
//  SCSE
//
//  Created by YJK on 11/12/22.
//

import SwiftUI

// 文章详情页
struct ArtivleView: View {
    @EnvironmentObject var userData:UserData
    @State private var quantity = 0
    @State var article : Article
    @State var heart = "heart.fill"
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                GeometryReader{reader in
                    Image(article.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        
                        .offset(y: -reader.frame(in: .global).minY)
                        // going to add parallax effect....
                        .frame(width: UIScreen.main.bounds.width, height:  reader.frame(in: .global).minY + 300)
                    
                }
                .frame(height: 280)
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text(article.title)
                        .font(.system(size: 35, weight: .bold))
                    
                    
                    HStack(spacing: 10){
                        
                        ForEach(1..<5){_ in
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                    
                    HStack {
                        Text(article.date)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.top,5)
                        Spacer()
                    }
                    
                    
                    Text("正文")
                        .font(.system(size: 25, weight: .bold))
                    
                    Text(article.context)
                        .padding(.top, 10)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.top, 25)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(20)
                .offset(y: -35)
            })
            Spacer()
        }
    }
    
}

struct Meal_Previews: PreviewProvider {
    static var previews: some View {
        ArtivleView(article: articleData[0])
    }
}
