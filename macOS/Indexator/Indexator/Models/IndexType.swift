//
//  IndexType.swift
//  Indexator
//
//  Created by Dionne Lie-Sam-Foek on 22/05/2022.
//

import Foundation

public enum IndexType: String, CaseIterable, Identifiable {
    case files, folders, both
    
    public var id: Self { self }
    
    public var title: String {
        self == .both ? "Files and Folders" : rawValue.capitalized
    }
}

public extension Array where Element == URL {
    func byType(_ type: IndexType) -> Self {
        switch type {
            case .files   : return filter(\.isFile)
            case .folders : return filter(\.isDirectory)
            case .both    : return self
        }
    }
}
