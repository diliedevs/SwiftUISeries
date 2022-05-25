//
//  IndexFile.swift
//  Indexator
//
//  Created by Dionne Lie-Sam-Foek on 22/05/2022.
//

import SwiftUI
import UniformTypeIdentifiers

public struct IndexFile: FileDocument {
    public static var readableContentTypes: [UTType] = [.plainText]
    
    var text = ""
    
    public init(initialText: String = "") {
        self.text = initialText
    }
    
    public init(indexURLs: [URL], for folderURL: URL, type: IndexType) {
        var lines = ["Contents of \(folderURL.name)"]
        lines.append(folderURL.path)
        lines.append("\(indexURLs.count) \(type.title.lowercased())")
        lines.append("\n")
        lines += indexURLs.map(\.representation)
        
        text = lines.joined(separator: "\n")
    }
    
    public init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            text = String(decoding: data, as: UTF8.self)
        }
    }
    
    public func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        FileWrapper(regularFileWithContents: Data(text.utf8))
    }
}
