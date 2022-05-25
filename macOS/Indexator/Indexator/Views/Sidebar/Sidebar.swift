//
//  Sidebar.swift
//  Indexator
//
//  Created by Dionne Lie-Sam-Foek on 23/05/2022.
//

import SwiftUI

struct Sidebar: View {
    @EnvironmentObject var dataController: DataController
    
    var body: some View {
        List {
            SidebarSection("Index Type") {
                IndexTypePicker(type: $dataController.type)
                    .labelsHidden()
            }
            
            SidebarSection("Index Content") {
                ContentOptionTogglers(options: $dataController.contentOptions)
            }
            
            SidebarSection("Post-Saving") {
                PostSavingOptionTogglers(options: $dataController.postSavingOptions)
            }
        }
        .frame(minWidth: 200, maxWidth: 300, minHeight: 500)
        .listStyle(.sidebar)
        .toolbar {
            ToolbarItem {
                Button(action: toggleSidebar) {
                    Label("Toggle Sidebar", systemImage: "sidebar.left")
                }
            }
        }
    }
}

private extension Sidebar {
    func toggleSidebar() {
        let selector = #selector(NSSplitViewController.toggleSidebar(_:))
        NSApp.sendAction(selector, to: nil, from: nil)
    }
}

fileprivate struct SidebarSection<Content: View>: View {
    let title: String
    @ViewBuilder let content: () -> Content
    
    init(_ title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
    
    var body: some View {
        Section {
            content()
        } header: {
            Text(title)
                .font(.headline)
                .textCase(.uppercase)
                .padding(.vertical)
        }
        .collapsible(false)
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
            .environmentObject(DataController())
    }
}
