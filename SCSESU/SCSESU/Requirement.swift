//
//  Requirement.swift
//  SCSESU
//
//  Created by jinshenghao on 2022/11/11.
//

import SwiftUI

struct Requirement: View {
    var iconName = "xmark.square"
    var iconColor = Color(red:251/255, green:128/255, blue:128/255)
    
    var text = ""
    var isStrikeThorugh = false
    var body: some View {
        HStack{
            Image(systemName: iconName).foregroundColor(iconColor)
            Text(text).font(.system(.body, design: .rounded)).foregroundColor(.secondary).strikethrough(isStrikeThorugh)
            Spacer()
        }
    }
}

struct Requirement_Previews: PreviewProvider {
    static var previews: some View {
        Requirement()
    }
}
