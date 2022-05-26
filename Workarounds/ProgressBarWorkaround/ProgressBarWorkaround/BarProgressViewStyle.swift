//
//  BarProgressViewStyle.swift
//  ProgressBarWorkaround
//
//  Created by Dionne Lie-Sam-Foek on 23/05/2022.
//

import SwiftUI

public struct BarProgressViewStyle: ProgressViewStyle {
    var completedColor : Color
    var incompleteColor: Color
    var height         : CGFloat
    var cornerRadius   : CGFloat
    
    public init(completedColor: Color = .accentColor,
                incompleteColor: Color = Color.gray.opacity(0.25),
                height: CGFloat = 5,
                cornerRadius: CGFloat = 5)
    {
        self.completedColor  = completedColor
        self.incompleteColor = incompleteColor
        self.height          = height
        self.cornerRadius    = cornerRadius
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        let progress = configuration.fractionCompleted ?? 0
        
        return VStack {
            configuration.label
            
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(incompleteColor)
                    
                    Rectangle()
                        .fill(completedColor)
                        .frame(width: minWidth(for: progress, in: geo.size.width))
                        .animation(.linear, value: configuration.fractionCompleted)
                }
                .cornerRadius(cornerRadius)
            }
            .frame(height: height)
        }
    }
    
    private func minWidth(for progress: Double, in geoWidth: CGFloat) -> CGFloat {
        min(geoWidth, geoWidth * CGFloat(progress))
    }
}

public extension ProgressViewStyle where Self == BarProgressViewStyle {
    static func bar(completedColor: Color = .accentColor,
                    incompleteColor: Color = Color(uiColor: .systemGray5),
                    height: CGFloat = 4,
                    cornerRadius: CGFloat = 10) -> Self
    {
        BarProgressViewStyle(completedColor: completedColor,
                             incompleteColor: incompleteColor,
                             height: height,
                             cornerRadius: cornerRadius)
    }
}

