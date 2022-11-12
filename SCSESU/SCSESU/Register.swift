//
//  Register.swift
//  SCSESU
//
//  Created by jinshenghao on 2022/11/11.
//

import SwiftUI

struct Register: View {
    @State private var username = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    var body: some View {
        VStack{
            Text("Create an account").font(.system(.largeTitle, design: .rounded)).bold().padding(.bottom, 30)
            Form(fieldName: "UserName", fieldValue: $username)
            Requirement(text: "A minimum of 4 characters").padding()
            
        }
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
