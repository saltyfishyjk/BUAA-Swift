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
    var placeHolder = "Nine years earlier, Lorem ipsum dolor sit amet,Morbi sed purus nulla. Curabitur dapibus ultrices lorem vitae tincidunt. Pellentesque quis arcu sit amet urna commodo porttitor. Aenean sit "
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
                        
                        Button(action: {
                            withAnimation(.spring(dampingFraction: 0.5)) {
                                if(heart == "heart.fill") {heart = "heart"}
                                else {heart="heart.fill"}
                            }
                        }, label: {
                            Image(systemName: heart)
                                .font(.largeTitle)
                                .foregroundColor(.red)
                            
                        })
                        .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    
                    
                    Text("Description")
                        .font(.system(size: 25, weight: .bold))
                    
                    Text(article.context)
                        .padding(.top, 10)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    
                    HStack {
                        Text("Quantity ")
                            .font(.title3)
                            .bold()
                        Spacer()
                        Stepper("",
                                onIncrement: {
                                    quantity+=3
                                }, onDecrement: {
                                    quantity-=3
                                })
                            .foregroundColor(.black)
                            .background(Color.white)
                            .frame(width: 100)
                    }.padding(.top, 10)
                    
                    /*
                    HStack {
                        Text("Price ")
                            .font(.title3)
                            .bold()
                        Spacer()
                        Text("$\(quantity+1).00")
                            .font(.title2)
                            .bold()
                    }
                    .padding(.top, 10)
                     */
                }
                .padding(.top, 25)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(20)
                .offset(y: -35)
            })
            
            
            Spacer()
            
            HStack{
                Spacer()
                Button(action: {}, label: {
                    Text("添加到收藏")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 100)
                        .background(Color.red)
                        .cornerRadius(10)
                    
                })
                Spacer()
            }
            .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            .edgesIgnoringSafeArea(.all)
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
    
}

struct Meal_Previews: PreviewProvider {
    static var previews: some View {
        ArtivleView(article: articleData[0])
    }
}
