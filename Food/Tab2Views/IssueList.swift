//
//  IssueList.swift
//  Food
//
//  Created by jinshenghao on 2022/11/16.
//

import Foundation
import SwiftUI

struct IssueList: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            
            ForEach(self.userData.issues) { issue in
                NavigationLink(
                    destination: IssueDetailView(
                        issue: issue
                    )
                ) {
                HStack {
                    IssueListItem(issue:issue)
                    .padding(10)
                    
                    Spacer()
                }.padding()
                }}
            

        }.frame(height: 400)
       
    }
}

struct IssueDetailView : View {
    var issue:Issue
    var body: some View {
        if(issue.type==1){
            Issue1DetailView(issue: issue)
        } else if(issue.type==2){
            Issue2DetailView(issue: issue)
        } else if(issue.type==3){
            Issue3DetailView(issue: issue)
        } else {
            Issue4DetailView(issue: issue)
        }
        
    }
}

struct Issue1DetailView : View {
    var issue:Issue
    var body: some View {
        Text("对学生会所提意见")
        Text(issue.title)
        Text(issue.content)

    }
}

struct Issue2DetailView : View {
    var issue:Issue
    var body: some View {
        Text("发起活动申请")
        Text(issue.title)
        Text(issue.target)
        Text("\(issue.money)")
        Text(issue.content)
        
        
        
    }
}

struct Issue3DetailView : View {
    var issue:Issue
    var body: some View {
        Text("输入姓名和学号查询入党进程")
        
        
        
        
    }
}

struct Issue4DetailView : View {
    var issue:Issue
    var body: some View {
        Text("提交权益申诉")
        Text(issue.title)
        Text(issue.department)
        Text(issue.content)
        
        
        
    }
}



struct IssueListItem : View {
    var issue:Issue
    var body: some View {
        
        HStack{
            if (issue.type == 1) {
                // typeName = "表达意见"
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width:90,height: 30)
                        .foregroundColor(.blue)
                    
                    Text("表达意见")
                        .foregroundColor(.white)
                        .bold()
                        .background(Color.blue)
                        .cornerRadius(20)
                        .shadow(radius: 1)
                }
            } else if issue.type == 2 {
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width:90,height: 30)
                        .foregroundColor(.blue)
                    
                    Text("申请活动")
                        .foregroundColor(.white)
                        .bold()
                        .background(Color.blue)
                        .cornerRadius(20)
                        .shadow(radius: 1)
                }
            } else if issue.type == 3 {
                Text("入党进程")
                    .background(Color.white)
                        .cornerRadius(15)
                        .shadow(radius: 1)
            } else {
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width:90,height: 30)
                        .foregroundColor(.blue)
                    
                    Text("权益维护")
                        .foregroundColor(.white)
                        .bold()
                        .background(Color.blue)
                        .cornerRadius(20)
                        .shadow(radius: 1)
                }
            }
            
            VStack {
                HStack{Text("标题：\(issue.title)")
                        .padding(10)
                    Spacer()}
                HStack{
                    Text("内容：\(issue.content)")
                        .padding(.leading,10)
                        .padding(.bottom,10)
                    Spacer()
                }
            }.background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 1)
                .frame(width: 200,height: 60)
                .padding(.leading,10)
        }
        
        
        
    }
    
}
