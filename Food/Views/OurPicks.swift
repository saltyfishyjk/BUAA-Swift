//
//  OurPicks.swift
//  SCSESU
//
//  Created by YJK on 2022/11/16.
//

import SwiftUI

// 精选内容页
struct OurPicks: View {
    @EnvironmentObject var userData:UserData
    @Binding var card : Article
    @Binding var hero : Bool
    @State var heart = "heart.fill"
    var body: some View {
        VStack {
            ZStack {
                Image(card.image)
                    .resizable()
                    .frame(width: self.card.isStared ? (UIScreen.main.bounds.width) : (UIScreen.main.bounds.width)*0.9 , height: self.card.isStared ? (UIScreen.main.bounds.height)*0.3 : (UIScreen.main.bounds.height)*0.25 )
                    .cornerRadius(self.card.isStared ? 5 : 20)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                if (self.card.isStared) {
                    HStack{
                        Spacer()
                        Button(action: {
                            
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                
                                self.card.isStared.toggle()
                                self.hero.toggle()
                            }
                            
                        }) {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.black.opacity(0.8))
                                .clipShape(Circle())
                            
                        }
                    }
                    .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
            }.edgesIgnoringSafeArea(.top)
            
            
            
            
            
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
                
                /*
                Text(card.price)
                    .font(.subheadline)
                    .bold()*/
            }
            .padding(.bottom, 30)
            .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(.trailing, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(.leading, self.card.isStared ? 10 : 20)
            .padding(.trailing, self.card.isStared ? 10 : 20)
            
            
            
            
            if self.card.isStared {
                VStack{
                    HStack {
                        Text("Description")
                            .font(.title)
                            .bold()
                            .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.spring(dampingFraction: 0.5)) {
                                heart = "heart"
                            }
                        }, label: {
                            Image(systemName: heart)
                                .font(.title)
                                .foregroundColor(.red)
                            
                        })
                        .padding(.trailing, 30)
                    }
                    Text(card.context)
                        .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

struct OurPicks_Previews: PreviewProvider {
    static var previews: some View {
        OurPicks(card:.constant(articleData[0]), hero:.constant(false))
    }
}
