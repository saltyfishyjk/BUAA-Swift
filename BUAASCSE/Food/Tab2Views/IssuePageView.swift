//
//  IssuePageView.swift
//  BUAASCSE
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
            HStack {
                Image("party")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80)
                    .clipped()
                Text("院会快捷服务")
                    .bold()
                    .font(.title)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.red)
                    .padding(.leading, 20)
                    .padding(.top, -40)
                Spacer()
            }
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
                
                
                let encoder = JSONEncoder()
                do  {
                    // 将player对象encod（编码）
                    let data: Data = try encoder.encode(self.userData.issues)
                    let filename = getDocumentsDirectory().appendingPathComponent("Issue.json")
                    try? data.write(to: filename)
                } catch {
                    
                }
                
            }})
            
            Button(
                action: {
                    
                    
                 
                    
                    
                    self.activityIssue = true }, label: {
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
                let encoder = JSONEncoder()
                do  {
                    // 将player对象encod（编码）
                    let data: Data = try encoder.encode(self.userData.issues)
                    let filename = getDocumentsDirectory().appendingPathComponent("Issue.json")
                    try? data.write(to: filename)
                } catch {
                    
                }
                
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
                        { PartyView()/* { stuId,stuName in
                    
                    
                    
                    self.userData.issues.insert(Issue(id: self.userData.issues.count, type: 3, stuId:stuId, stuName: stuName), at: 0)
                }*/
                    
                })
                
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
                    
                    let encoder = JSONEncoder()
                    do  {
                        // 将player对象encod（编码）
                        let data: Data = try encoder.encode(self.userData.issues)
                        let filename = getDocumentsDirectory().appendingPathComponent("Issue.json")
                        try? data.write(to: filename)
                    } catch {
                        
                    }
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
                self.presentationMode.wrappedValue.dismiss()}) {
                    HStack {
                        Image(systemName: "paperplane")
                            .font(.title)
                        Text("提交")
                    }
                }
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct PartyView: View {
    @EnvironmentObject var userData:UserData
    @Environment(\.presentationMode) var presentationMode
    
    @State var stuId=""
    @State var stuName=""
    
    @State var nullAlert=false
    
    @State var result=""
    
    
    //let onIssueFinished: (String,String) -> Void
    
    var body: some View {
        VStack {
            TextField("学号",text:self.$stuId)
            TextField("姓名",text:self.$stuName)
            Text("入党进程：\(result)")
            
            Button(action: {
                let u = self.userData.users.filter{$0.name == self.stuName}
                if(u.isEmpty){
                    self.nullAlert=true
                }else {
                    let t = u.filter{$0.number == self.stuId}
                    if(t.isEmpty){
                        self.nullAlert=true
                    }
                    else {
                        
                        self.result=t[0].progress
                        
                    }
                }
                
            }
            
            ) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                        Text("查询")
                    }
                }
                .alert(isPresented: $nullAlert) {
                    Alert(title: Text("查询失败"), message: Text("学号或姓名错误"))
                }
            
            
            Button(action: {
                
                self.presentationMode.wrappedValue.dismiss()}
            
            ) {
                
                    HStack {
                        Image(systemName: "xmark")
                            .font(.title)
                        Text("返回")
                    }
                }
            
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
                self.presentationMode.wrappedValue.dismiss()}) {
                    HStack {
                        Image(systemName: "paperplane")
                            .font(.title)
                        Text("提交")
                    }
                }

            
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
                self.presentationMode.wrappedValue.dismiss()}) {
                    HStack {
                        Image(systemName: "paperplane")
                            .font(.title)
                        Text("提交")
                    }
                }
            
        }.edgesIgnoringSafeArea(.all)
    }
}
