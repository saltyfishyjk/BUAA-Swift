//
//  Form.swift
//  SCSESU
//
//  Created by jinshenghao on 2022/11/12.
//

import SwiftUI

struct Form: View {
    var fieldName = ""
    @Binding var fieldValue: String
    var isSecure = false
    var body: some View {
        VStack {
            if isSecure {
                SecureField(fieldName, text: $fieldValue).font(.system(size:20, weight: .semibold, design: .rounded)).padding(.horizontal)
            } else {
                TextField(fieldName, text:$fieldValue).font(.system(size: 20, weight: .semibold, design: .rounded)).padding(.horizontal)
            }
            
            Divider().frame(height: 1).background(Color(red:240/255, green: 240/255, blue: 240/255)).padding(.horizontal)
        }
    }
}

struct Form_Previews: PreviewProvider {
    static var previews: some View {
        Form()
    }
}
