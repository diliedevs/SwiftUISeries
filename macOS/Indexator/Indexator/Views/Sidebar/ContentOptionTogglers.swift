//
//  ContentOptionTogglers.swift
//  Indexator
//
//  Created by Dionne Lie-Sam-Foek on 23/05/2022.
//

import SwiftUI

struct ContentOptionTogglers: View {
    @Binding var options: Set<ContentOption>
    
    var body: some View {
        Group {
            ForEach(ContentOption.allCases) { option in
                Toggle(option.title, isOn: binding(for: option))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private extension ContentOptionTogglers {
    func binding(for option: ContentOption) -> Binding<Bool> {
        Binding(
            get: { options.contains(option) },
            set: { _ in options.toggle(option) }
        )
    }
}

struct ContentOptionTogglers_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ContentOptionTogglers(options: .constant([.relativePaths, .recursive, .hiddenItems, .packages]))
        }
    }
}
