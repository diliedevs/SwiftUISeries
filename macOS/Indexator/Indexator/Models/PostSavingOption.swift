//
//  PostSavingOption.swift
//  Indexator
//
//  Created by Dionne Lie-Sam-Foek on 22/05/2022.
//

import Foundation

public enum PostSavingOption: String, CaseIterable, Identifiable {
    case finder, openFile, quit
    
    public var id: Self { self }
    
    public var title: String {
        switch self {
            case .finder   : return "Show in Finder"
            case .openFile : return "Open index file"
            case .quit     : return "Quit Indexator"
        }
    }
}
