//
//  IssuePageView.swift
//  Food
//
//  Created by jinshenghao on 2022/11/16.
//

import Foundation
import SwiftUI
import UIKit



struct IssusPageView : View {
    @EnvironmentObject var userData:UserData
    
    @State var showWriteIssue=false
    
    
    
    
    var body : some View {
        VStack{
            Button(
                action: { self.showWriteIssue = true }, label: {
                    VStack {
                        Image(systemName: "plus.square")
                            .font(.system(size: 35))
                            .foregroundColor(Color.gray.opacity(0.85)).padding(10)
                        Text("点击上传意见")
                            .foregroundColor(Color.gray.opacity(0.85))
                            .font(.system(size: 17))}
                            .frame(width: 130, height: 130)
                            .background(Color.gray.opacity(0.2))
                            .overlay(RoundedRectangle(cornerRadius:10).stroke(Color.gray, style: StrokeStyle(lineWidth: 1, dash: [10])))})
            .sheet(isPresented: self.$showWriteIssue,content:
                    { WriteIssueView { titleText,content in
                
                self.userData.issues.insert(Issue(id: self.userData.issues.count, type: 1, title: titleText, content: content), at: 0)
            }})
            
            IssueList()
        }
    }
    
}


struct WriteIssueView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var titleText=""
    @State var content=""
    
    
    let onIssueFinished: (String,String) -> Void
    
    var body: some View {
        VStack {
            TextField("标题",text:self.$titleText)
            TextField("提案",text:self.$content)
            
            Button(action: {
                self.onIssueFinished(self.titleText,self.content)
                self.presentationMode.wrappedValue.dismiss()},
                   
                   label: {Text("提交")})
            
        
                
            Spacer()
        }.edgesIgnoringSafeArea(.all)
    }
}
