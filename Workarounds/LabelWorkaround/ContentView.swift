//
//  ContentView.swift
//  LabelWorkaround
//
//  Created by Dionne Lie-Sam-Foek on 22/05/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var defaultLabelColor: Color { colorScheme == .dark ? .blue : .orange }
    var reverseLabelColor: Color { colorScheme == .dark ? .orange : .blue }
    
    var body: some View {
        VStack(spacing: 40) {
            VStack(spacing: 8) {
                Text("SwiftUI Series Workarounds")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                
                Text("Reverse LabelStyle")
                    .font(.title2)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text("The default label style, showing both the icon and the title, always shows the icon to the left of the title.")
                Text("Sometimes I have an element where I find it nicer to have the icon placed to the right of the title.")
                Text("This is, unfortunately, not a standard option, so I've created my own Reverse LabelStyle. See the result below.")
            }
            .font(.callout)
            .padding()
            .foregroundStyle(.primary)
            .background(.ultraThickMaterial, in: RoundedRectangle(cornerRadius: 5))
        
            VStack {
                HStack {
                    Label("Default LabelStyle", systemImage: "tag.fill")
                        .foregroundColor(defaultLabelColor)
                    Spacer()
                    Label("Reverse LabelStyle", systemImage: "tag.fill")
                        .labelStyle(.reversed)
                        .foregroundColor(reverseLabelColor)
                }
                .font(.footnote.bold())
            }
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
