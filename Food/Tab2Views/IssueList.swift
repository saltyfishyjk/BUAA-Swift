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
        Text("this is detail")
        Text(issue.title)
        Text(issue.content)
    }
    
    
}


struct IssueListItem : View {
    var issue:Issue
    var body: some View {
        Text(issue.title)
        Text(issue.content)
    }
    
}
