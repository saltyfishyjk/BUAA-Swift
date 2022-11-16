//
//  FormField.swift
//  SCSESU
//
//  Created by YJK on 2022/11/12.
//

import SwiftUI

// 文本编辑框，用于组成一部分
struct FormField: View {
    @EnvironmentObject var userData:UserData
    var fieldName = ""
    @Binding var fieldValue:String
    var isSecure = false
    
    var body: some View {
        VStack {
            if isSecure {
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded)).padding(.horizontal)
            } else {
                TextField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            }
            
            Divider()
                .frame(height: 1)
                .background(Color(red: 240/255, green: 240/255, blue:240/255))
                .padding(.horizontal)
        }
    }
}

 struct FormField_Previews: PreviewProvider {
     @State private var fieldValue = ""
     
     static var previews: some View {
         FormField(fieldName: "test field name", fieldValue: .constant("test content"))
    }
 }
 
