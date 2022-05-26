//
//  ContentView.swift
//  ProgressBarWorkaround
//
//  Created by Dionne Lie-Sam-Foek on 23/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = Double.random(in: 0.2...0.8)
    @State private var completeColor = Color.accentColor
    @State private var incompleteColor = Color.gray.opacity(0.25)
    @State private var barHeight = 5
    @State private var cornerRadius = 5
    
    var body: some View {
        Form {
            Section {
                VStack(spacing: 8) {
                    Text("SwiftUI Series Workarounds")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    
                    Text("Progress Bar Workaround")
                        .font(.title2)
                }
                .padding(.vertical)
            }
            
            Section {
                ProgressView(value: progress) {
                    Text("Default Progress Bar")
                        .padding(.bottom, 8)
                }
                .tint(completeColor)
                .padding(.vertical)
                
                ProgressView(value: progress) {
                    Text("Progress Bar Workaround")
                }
                .padding(.vertical)
                .progressViewStyle(.bar(
                    completedColor: completeColor,
                    incompleteColor: incompleteColor,
                    height: CGFloat(barHeight),
                    cornerRadius: CGFloat(cornerRadius))
                )
            }
            
            Section {
                ColorPicker("Complete Color", selection: $completeColor)
                ColorPicker("Incomplete Color", selection: $incompleteColor)
                
                HStack {
                    Text("Bar Height")
                    Picker("Bar Height", selection: $barHeight) {
                        ForEach([2, 5, 8, 10, 15, 20], id: \.self) { height in
                            Text(height.formatted(.number))
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                HStack {
                    Text("Corner Radius")
                    Picker("Corner Radius", selection: $cornerRadius) {
                        ForEach([0, 3, 5, 8, 10], id: \.self) { height in
                            Text(height.formatted(.number))
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
