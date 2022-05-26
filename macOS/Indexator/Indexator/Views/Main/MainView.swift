//
//  MainView.swift
//  Indexator
//
//  Created by Dionne Lie-Sam-Foek on 23/05/2022.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var dataController: DataController
    @State private var showingExporter = false
    
    var body: some View {
        VStack {
            FolderPicker(folderURL: $dataController.folderURL)
            
            Divider()
                .background(Color.accentColor.opacity(0.25))
                .padding(.vertical, 8)
            
            HStack {
                Text(dataController.resultsHeadline)
                    .font(.headline)
                
                Spacer()
                
                saveButton
            }
            
            if dataController.results.isEmpty {
                Text("Choose a folder to indexate")
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List {
                    ForEach(dataController.results, id: \.self) { url in
                        HStack {
                            Text(url.icon)
                            Text(url.relativePath)
                                .lineLimit(1)
                                .truncationMode(.head)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

private extension MainView {
    var saveButton: some View {
        Button {
            dataController.makeIndexFile()
            showingExporter.toggle()
        } label: {
            Label("Save…", systemImage: "arrow.down.doc.fill")
        }
        .keyboardShortcut(KeyEquivalent("s"))
        .disabled(dataController.results.isEmpty)
        .fileExporter(isPresented: $showingExporter, document: dataController.indexFile, contentType: .plainText, defaultFilename: dataController.indexFilename) { result in
            let url = try? result.get()
            dataController.postProcessIndex(at: url)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(DataController())
    }
}
