//
//  OnBoarding.swift
//  SCSESU
//
//  Created by YJK on 11/12/22.
//

import SwiftUI
import UIKit

// 欢迎页

struct OnBoarding: View {
    //@EnvironmentObject var userData:UserData
    @State var showSheetView = false
    
    init() {
        // 翻页按钮颜色
        UIPageControl.appearance().currentPageIndicatorTintColor = .blue
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        }
    // 展示欢迎页面
    var body: some View {
        NavigationView {
            pages()
        }.sheet(isPresented: $showSheetView) {
            Login()
        }.animation(.none)
    }
    
}



struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}

// 欢迎页面播放
struct pages: View {
    var body: some View {
        VStack {
                TabView {
                    ForEach(loadingData) { page in
                        GeometryReader { g in
                            VStack {
                                // 设置图片
                                Image(page.image)
                                    .resizable()
                                    .scaledToFit()
                                // 设置标题文字
                                Text(page.title)
                                    .font(.title).bold()
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 20)
                                // 设置字体
                                Text(page.descrip)
                                    .multilineTextAlignment(.center)
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            }
                            .opacity(Double(g.frame(in : . global).minX)/200+1)
                        }
                    }
                    //Login()
                }
                .edgesIgnoringSafeArea(.top)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            NavigationLink(
                destination: 
                Login().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                label: {
                    // 设置底部标签，跳转入登陆注册页面
                    Text("立刻启程")
                        .font(.headline)
                        .frame(width: 200, height: 40, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(#colorLiteral(red: 0.3403331637, green: 0.10593573, blue: 0.9580881, alpha: 1)))
                        .cornerRadius(10)
                })
            Spacer()
            
        }
        // 设置右上角箭头➡️
        .navigationBarItems(trailing:
                                NavigationLink(
                                    destination: //Location().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                                    Login().navigationBarBackButtonHidden(true).navigationBarBackButtonHidden(true),
                                    label: {
                                        Image(systemName: "arrow.right")
                                            .font(Font.system(.title3))
                                            .foregroundColor(Color(#colorLiteral(red: 0.3403331637, green: 0.10593573, blue: 0.9580881, alpha: 1)))
                                    })
        )
        .navigationBarBackButtonHidden(true)
    }
}
