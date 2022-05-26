//
//  DataController.swift
//  Indexator
//
//  Created by Dionne Lie-Sam-Foek on 22/05/2022.
//

import Foundation
import AppKit

public class DataController: ObservableObject {
    @Published public var folderURL: URL = .root {
        didSet { processFolder() }
    }
    @Published public var type: IndexType = .both {
        didSet { processFolder() }
    }
    @Published public var contentOptions: Set<ContentOption> = [.relativePaths, .recursive] {
        didSet { processFolder() }
    }
    
    @Published public var results = [URL]()
    @Published public var postSavingOptions: Set<PostSavingOption> = [.finder, .openFile]
    
    public var indexFile = IndexFile()

    public var resultsHeadline : String { "\(results.count) \(type.title.lowercased())" }
    public var indexFilename   : String { "\(folderURL.name) Index" }
}

public extension DataController {
    func makeIndexFile() {
        indexFile = IndexFile(indexURLs: results, for: folderURL, type: type)
    }
    
    func postProcessIndex(at url: URL?) {
        guard let url = url else { return }

        NSSound(named: "OK Hand Sign")?.play()
        let workspace = NSWorkspace.shared
        if postSavingOptions.contains(.finder)   { workspace.activateFileViewerSelecting([url]) }
        if postSavingOptions.contains(.openFile) { workspace.open(url) }
        if postSavingOptions.contains(.quit)     { NSApp.terminate(nil) }
    }
}

private extension DataController {
    func processFolder() {
        var options = FileManager.DirectoryEnumerationOptions([.skipsSubdirectoryDescendants, .skipsHiddenFiles, .skipsPackageDescendants])
        if contentOptions.contains(.relativePaths) { options.insert(.producesRelativePathURLs) }
        if contentOptions.contains(.recursive)     { options.remove(.skipsSubdirectoryDescendants) }
        if contentOptions.contains(.hiddenItems)   { options.remove(.skipsHiddenFiles) }
        if contentOptions.contains(.packages)      { options.remove(.skipsPackageDescendants) }
        
        let urls = FileManager.default.indexateFolder(at: folderURL, options: options)
        results = urls.byType(type)
    }
}
