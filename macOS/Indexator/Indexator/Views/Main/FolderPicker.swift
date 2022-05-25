//
//  FolderPicker.swift
//  Indexator
//
//  Created by Dionne Lie-Sam-Foek on 23/05/2022.
//

import SwiftUI

struct FolderPicker: View {
    @Binding var folderURL: URL
    @State private var showingImporter = false
    
    var body: some View {
        HStack {
            Text("Folder:")
            Text(folderURL.path)
                .lineLimit(1)
                .truncationMode(.head)
            Spacer()
            Button {
                showingImporter.toggle()
            } label: {
                Label("Browse…", systemImage: "magnifyingglass.circle.fill")
            }
            .keyboardShortcut(KeyEquivalent("b"))
        }
        .fileImporter(isPresented: $showingImporter, allowedContentTypes: [.folder]) { result in
            if let url = try? result.get() {
                folderURL = url
            }
        }
    }
}

struct FolderPicker_Previews: PreviewProvider {
    static var previews: some View {
        FolderPicker(folderURL: .constant(.root))
    }
}
