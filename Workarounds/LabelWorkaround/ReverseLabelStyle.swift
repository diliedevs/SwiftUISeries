//
//  ReverseLabelStyle.swift
//  LabelWorkaround
//
//  Created by Dionne Lie-Sam-Foek on 22/05/2022.
//

import SwiftUI

public struct ReverseLabelStyle: LabelStyle {
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

public extension LabelStyle where Self == ReverseLabelStyle {
    static var reversed: Self {
        .init()
    }
}
