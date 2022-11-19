//
//  IssuePageView.swift
//  Food
//
//  Created by jinshenghao on 2022/11/16.
//

import Foundation
import SwiftUI
import UIKit



struct IssuePageView : View {
    @EnvironmentObject var userData:UserData
    
    @State var showWriteIssue=false
    @State var activityIssue=false
    @State var searchPartyIssue=false
    @State var ihomeIssue=false
    
    
    
    
    var body : some View {
        VStack{
            HStack{
            Button(
                action: { self.showWriteIssue = true }, label: {
                    VStack {
                        //Image(systemName: "plus.square")
                        //   .font(.system(size: 35))
                        //    .foregroundColor(Color.gray.opacity(0.85)).padding(10)
                        Image("scse")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                            .clipped()
                        Text("表达意见")
                            .foregroundColor(Color.black.opacity(0.85))
                        .font(.system(size: 17))}
                    .frame(width: 130, height: 130)
                    //.background(Color.gray.opacity(0.2))
                    .overlay(RoundedRectangle(cornerRadius:10).stroke(Color.gray, style: StrokeStyle(lineWidth: 1, dash: [10])))})
            .sheet(isPresented: self.$showWriteIssue,content:
                    { WriteIssueView { titleText,content in
                
                self.userData.issues.insert(Issue(id: self.userData.issues.count, type: 1, title: titleText, content: content), at: 0)
            }})
            
            Button(
                action: { self.activityIssue = true }, label: {
                    VStack {
                        //Image(systemName: "plus.square")
                          //  .font(.system(size: 35))
                          //  .foregroundColor(Color.gray.opacity(0.85)).padding(10)
                        Image("activity")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90)
                            .clipped()
                        Text("申请活动")
                            .foregroundColor(Color.blue.opacity(0.85))
                        .font(.system(size: 17))}
                    .frame(width: 130, height: 130)
                    //.background(Color.blue.opacity(0.2))
                    .overlay(RoundedRectangle(cornerRadius:10).stroke(Color.gray, style: StrokeStyle(lineWidth: 1, dash: [10])))})
            .sheet(isPresented: self.$activityIssue,content:
                    { ActivityView { titleText,target,money,content in
                
                self.userData.issues.insert(Issue(id: self.userData.issues.count, type: 2, title: titleText,
            target:target,money:money,content: content), at: 0)
            }})
            
        }
            
            HStack{
                Button(
                    action: { self.searchPartyIssue = true }, label: {
                        VStack {
                            //Image(systemName: "plus.square")
                            //    .font(.system(size: 35))
                            //    .foregroundColor(Color.gray.opacity(0.85)).padding(10)
                            Image("party")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                                .clipped()
                            Text("入党进程")
                                .foregroundColor(Color.red.opacity(0.85))
                            .font(.system(size: 17))}
                        .frame(width: 130, height: 130)
                        //.background(Color.gray.opacity(0.2))
                        .overlay(RoundedRectangle(cornerRadius:10).stroke(Color.gray, style: StrokeStyle(lineWidth: 1, dash: [10])))})
                .sheet(isPresented: self.$searchPartyIssue,content:
                        { PartyView { stuId,stuName in
                    
                    
                    
                    self.userData.issues.insert(Issue(id: self.userData.issues.count, type: 3, stuId:stuId, stuName: stuName), at: 0)
                }})
                
                Button(
                    action: { self.ihomeIssue = true }, label: {
                        VStack {
                            //Image(systemName: "plus.square")
                            //    .font(.system(size: 35))
                            //    .foregroundColor(Color.gray.opacity(0.85)).padding(10)
                            Image("shield")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90)
                                .clipped()
                            Text("权益维护")
                                .foregroundColor(Color.yellow.opacity(0.85))
                            .font(.system(size: 17))}
                        .frame(width: 130, height: 130)
                        //.background(Color.gray.opacity(0.2))
                        .overlay(RoundedRectangle(cornerRadius:10).stroke(Color.gray, style: StrokeStyle(lineWidth: 1, dash: [10])))})
                .sheet(isPresented: self.$ihomeIssue,content:
                        { ihomeIssueView { titleText,department,content in
                    
                    self.userData.issues.insert(Issue(id: self.userData.issues.count, type: 4, title: titleText,department:department, content: content), at: 0)
                }})
                
            
            }
            IssueList()
        }
    }
}

struct ActivityView : View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var titleText=""
    @State var target=""
    @State var money=0
    @State var content=""
    
    
    let onIssueFinished: (String,String,Int,String) -> Void
    
    var body: some View {
        VStack {
            TextField("标题",text:self.$titleText)
            TextField("目标",text:self.$target)
            TextField("预算", value: $money, formatter: NumberFormatter())
            TextField("内容",text:self.$content)
            
            Button(action: {
                self.onIssueFinished(self.titleText,self.target,self.money,self.content)
                self.presentationMode.wrappedValue.dismiss()},
                   label: {Text("提交")})
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct PartyView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var stuId=""
    @State var stuName=""
    
    
    let onIssueFinished: (String,String) -> Void
    
    var body: some View {
        VStack {
            TextField("学号",text:self.$stuId)
            TextField("姓名",text:self.$stuName)
            
            Button(action: {
                self.onIssueFinished(self.stuId,self.stuName)
                self.presentationMode.wrappedValue.dismiss()},
                   label: {Text("提交")})
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ihomeIssueView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var titleText=""
    @State var department=""
    @State var content=""
    
    
    let onIssueFinished: (String,String,String) -> Void
    
    var body: some View {
        VStack {
            TextField("标题",text:self.$titleText)
            TextField("部门",text:self.$department)
            TextField("权益申请",text:self.$content)
            
            Button(action: {
                self.onIssueFinished(self.titleText,self.department,self.content)
                self.presentationMode.wrappedValue.dismiss()},
                   label: {Text("提交")})
            
        }.edgesIgnoringSafeArea(.all)
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
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct IssuePageView_Previews:PreviewProvider {
    static var previews: some View {
        IssuePageView()
    }
}
