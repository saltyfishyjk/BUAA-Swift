//
//  Login.swift
//  Food
//
//  Created by jinshenghao on 2022/11/12.
//

import SwiftUI

struct Login: View {
    @ObservedObject private var userRistrantionViewModel = UserregistrationViewModel()
    @State private var showAlert = false
     
    var body: some View {
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
            NavigationLink(
                destination:
                    NavBar().navigationBarBackButtonHidden(true).navigationBarHidden(true),
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
            HStack {
                Text("还没有账户？")
                    .font(.system(.body, design: .rounded))
                    .bold()
                NavigationLink(
                    destination:
                        Register().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                    label:{
                        Text("注册")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundColor(Color(red: 251/255, green:  128/255, blue: 128/255))
                })
            }.padding(.top, 50)
            
            Spacer()
            
        }.padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("登录失败"), message: Text("用户名或密码不对，请检查你输入的用户名和密码"), primaryButton: .default(Text("Yes")), secondaryButton: .default(Text("No")))
            }
        
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
