//
//  Welcome.swift
//  SCSESU
//
//  Created by jinshenghao on 2022/11/11.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        VStack {
            Text("欢迎来到计算机学院学生会\n").font(.title)
            Text("全心全意            为你而来").font(.subheadline)
        }
        
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
