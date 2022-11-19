//
//  ContentView.swift
//  Food
//
//  Created by BqNqNNN on 7/12/20.
//

import SwiftUI

struct ContentView: View {
    @State var hasLogin = false
    var body: some View {
        VStack {
            //OnBoarding()
            
            NavigationView {
                if hasLogin {
                    NavBar()
                }  else {
                    
                        test(){ i in
                            hasLogin = i
                        }
                    
                }
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct test: View {
    let onLoginFinished: (Bool) -> Void
    @ObservedObject private var userRistrantionViewModel = UserregistrationViewModel()
    @State private var showAlert = false
    @EnvironmentObject var userData: UserData
    
    @State private var registerAlert = false
    
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
                VStack {
                    Text("登录")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .padding(.bottom, 30)
                    // 用户名
                    FormField(fieldName: "用户名", fieldValue: $userRistrantionViewModel.name)
                    RequirementText(iconColor: userRistrantionViewModel.isNameLengthVaild ? Color.secondary : Color(red:251/255, green: 128/255, blue:128/255), text: "至少4个字符", isStrikeThrough: userRistrantionViewModel.isNameLengthVaild)
                        .padding()
                    FormField(fieldName: "密码", fieldValue: $userRistrantionViewModel.password, isSecure: true)
                    // 密码
                    VStack {
                        RequirementText(iconName: "lock.open", iconColor: userRistrantionViewModel.isPasswordLengthVaild ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255), text:"至少8个字符", isStrikeThrough: userRistrantionViewModel.isPasswordLengthVaild)
                        RequirementText(iconName: "lock.open", iconColor: userRistrantionViewModel.isPasswordCapitalLetter ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255), text: "至少1个大写字母", isStrikeThrough: userRistrantionViewModel.isPasswordCapitalLetter)
                    }
                    .padding()
                    
                    
                    
                    Button(action: {
                        
                        
                        let tmp = self.userData.users.filter { $0.name == userRistrantionViewModel.name }
                        if( tmp.count != 1){
                            self.showAlert=true
                        }else if (tmp[0].password != userRistrantionViewModel.password ){
                            self.showAlert=true
                        }else {
                            self.userData.userId = tmp[0].id
                            
                            
                            onLoginFinished(true)
                            
                            
                        }
                        
                        
                        
                    },
                        label:{
                            Text("登录")
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(.white)
                                .bold()
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(LinearGradient(gradient: Gradient(colors: [Color(red:251/255, green:128/255, blue: 128/255), Color(red: 253/255, green: 193/255, blue: 104/255)]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(10)
                                .padding(.horizontal)
                    })
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("登录失败"), message: Text("用户名或密码不对，请检查你输入的用户名和密码"))
                    }
                    
                    Button(action: {
                        
                        let tmp = self.userData.users.filter { $0.name == userRistrantionViewModel.name }
                        if( tmp.count == 1){
                            self.registerAlert=true
                        }else if (userRistrantionViewModel.name == "" ){
                            self.registerAlert=true
                        }else {
                            self.userData.userId = self.userData.users.count
                            self.userData.users.append(User(id: self.userData.users.count, number: "aaa", password: userRistrantionViewModel.password, role: 1, name: userRistrantionViewModel.name))
                            
                            
                            let encoder = JSONEncoder()
                            do  {
                                // 将player对象encod（编码）
                                let data: Data = try encoder.encode(self.userData.users)
                                let filename = getDocumentsDirectory().appendingPathComponent("UserInfo.json")
                                try? data.write(to: filename)
                            } catch {
                                
                            }
                            
                            onLoginFinished(true)
                            
                            
                        }
                        
                    },
                        label:{
                            Text("注册")
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(.white)
                                .bold()
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(LinearGradient(gradient: Gradient(colors: [Color(red:251/255, green:128/255, blue: 128/255), Color(red: 253/255, green: 193/255, blue: 104/255)]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(10)
                                .padding(.horizontal)
                    }).padding()
                        .alert(isPresented: $registerAlert) {
                            Alert(title: Text("注册失败"), message: Text("用户名重复或用户名不能为空"))
                        }
                    
                    
                    Spacer()
                    
                }
            }
            .edgesIgnoringSafeArea(.top)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
        
    }
    
}
