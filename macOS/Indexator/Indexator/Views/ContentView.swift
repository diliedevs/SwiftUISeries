//
//  ContentView.swift
//  Indexator
//
//  Created by Dionne Lie-Sam-Foek on 22/05/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataController: DataController
    
    var body: some View {
        NavigationView {
            Sidebar()
            
            MainView()
        }
        .frame(minWidth: 800)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataController())
            .previewLayout(.fixed(width: 800, height: 400))
    }
}
