//
//  ContentOption.swift
//  Indexator
//
//  Created by Dionne Lie-Sam-Foek on 22/05/2022.
//

import Foundation

public enum ContentOption: String, CaseIterable, Identifiable {
    case relativePaths, recursive, hiddenItems, packages
    
    public var id: Self { self }
    
    public var title: String {
        switch self {
            case .relativePaths : return "Use relative paths"
            case .recursive     : return "Recursively indexate"
            case .hiddenItems   : return "Include hidden items"
            case .packages      : return "Include package contents"
        }
    }
}
