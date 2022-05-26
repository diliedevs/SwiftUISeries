//
//  PostSavingOptionTogglers.swift
//  Indexator
//
//  Created by Dionne Lie-Sam-Foek on 23/05/2022.
//

import SwiftUI

struct PostSavingOptionTogglers: View {
    @Binding var options: Set<PostSavingOption>
    
    var body: some View {
        Group {
            ForEach(PostSavingOption.allCases) { option in
                Toggle(option.title, isOn: binding(for: option))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private extension PostSavingOptionTogglers {
    func binding(for option: PostSavingOption) -> Binding<Bool> {
        Binding(
            get: { options.contains(option) },
            set: { _ in options.toggle(option) }
        )
    }
}

struct PostProcessingOptionTogglers_Previews: PreviewProvider {
    static var previews: some View {
        List {
            PostSavingOptionTogglers(options: .constant([.finder, .openFile]))
        }
    }
}
