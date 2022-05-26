//
//  IndexatorApp.swift
//  Indexator
//
//  Created by Dionne Lie-Sam-Foek on 22/05/2022.
//

import SwiftUI

@main
struct IndexatorApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataController)
        }
        .commands {
            SidebarCommands()
        }
    }
}
