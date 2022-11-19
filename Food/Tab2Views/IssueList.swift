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
                    destination: IssueListItem(
                        issue: issue
                    )
                ) {
                HStack {
                    IssueListItem(issue:issue)
                    .padding()
                    Spacer()

                    
                }.padding()
                        
               // }
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
        if (issue.type == 1) {
            // typeName = "表达意见"
            Text("表达意见")
        } else if issue.type == 2 {
            Text("申请活动")
        } else if issue.type == 3 {
            Text("入党进程")
        } else {
            Text("权益维护")
        }
        
        Text(issue.title)
        Text(issue.content)
    }
    
}
