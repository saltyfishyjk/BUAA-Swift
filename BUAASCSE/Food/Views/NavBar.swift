//
//  navBar.swift
//  BUAASCSE
//

import SwiftUI

struct NavBar: View {
    //@EnvironmentObject var userData:UserData
    @State private var selection = 1
    init() {
       // UITabBar.appearance().backgroundColor = .white
    }
    var body: some View {
        TabView(selection: $selection) {
            HomeView().tabItem {
                VStack {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                
            }.tag(1)
            
            //MessagesView().tabItem {
            IssuePageView().tabItem {
                VStack {
                    Image(systemName: "envelope.fill")
                    Text("Message")
                }
                
            }.tag(2)
            
            ProfileView().tabItem {
                VStack {
                    Image(systemName: "person.fill")
                    Text("Me")
                }
                
            }.tag(3)
        }
        .accentColor(.blue)
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
