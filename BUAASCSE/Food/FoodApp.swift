//
//  FoodApp.swift
//  BUAASCSE
//

import SwiftUI

@main
struct FoodApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(UserData())
        }
    }
}
