//
//  Register.swift
//  Food
//
//  Created by YJK on 11/12/22.
//

import SwiftUI

struct Register: View {
    /*
    @State private var name = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var id = ""
    @State private var role = 2
    */
    @ObservedObject private var userRistrantionViewModel = UserregistrationViewModel()
     
    var body: some View {
        VStack {
            Text("注册账户")
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
            
            FormField(fieldName: "重复密码", fieldValue: $userRistrantionViewModel.passwordConfirm, isSecure: true)
            RequirementText(iconColor: userRistrantionViewModel.isPasswordComfirmValid ? Color.secondary : Color(red: 251/255, green: 128/255, blue: 128/255), text: "重复密码应当一致",  isStrikeThrough: userRistrantionViewModel.isPasswordComfirmValid
            )
            .padding()
            .padding(.bottom, 50)
            
            Button(action: {
                // 进入下一个页面
            }) {
                Text("注册")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red:251/255, green:128/255, blue: 128/255), Color(red: 253/255, green: 193/255, blue: 104/255)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            HStack {
                Text("已经有账户了？")
                    .font(.system(.body, design: .rounded))
                    .bold()
                
                Button(action: {
                    // 进入登录页面
                }) {
                    Text("登录")
                        .font(.system(.body, design: .rounded))
                        .bold()
                        .foregroundColor(Color(red: 251/255, green:  128/255, blue: 128/255))
                }
            }.padding(.top, 50)
            
            Spacer()
            
        }.padding()
        
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
