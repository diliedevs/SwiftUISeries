//
//  Helpers.swift
//  Indexator
//
//  Created by Dionne Lie-Sam-Foek on 22/05/2022.
//

import SwiftUI

public extension SetAlgebra {
    mutating func toggle(_ element: Element) {
        if self.contains(element) { self.remove(element) }
        else                      { self.insert(element) }
    }
}

public extension URL {
    static let root = URL(fileURLWithPath: "/")
    
    var isDirectory    : Bool   { hasDirectoryPath }
    var isFile         : Bool   { hasDirectoryPath == false }
    var filename       : String { lastPathComponent }
    var name           : String { deletingPathExtension().lastPathComponent }
    var icon           : String { isFile ? "📄" : "🗂" }
    var representation : String { "\(icon) \(relativePath)" }
}

public extension FileManager {
    func indexateFolder(at url: URL, options: DirectoryEnumerationOptions) -> [URL] {
        let enumerator = enumerator(at: url, includingPropertiesForKeys: nil, options: options)
        let urls = enumerator?.allObjects as? [URL]
        
        return urls ?? []
    }
}

