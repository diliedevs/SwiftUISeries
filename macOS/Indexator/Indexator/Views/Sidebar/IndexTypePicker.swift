//
//  IndexTypePicker.swift
//  Indexator
//
//  Created by Dionne Lie-Sam-Foek on 23/05/2022.
//

import SwiftUI

struct IndexTypePicker: View {
    @Binding var type: IndexType
    
    var body: some View {
        Picker("Index Type", selection: $type) {
            ForEach(IndexType.allCases) { aType in
                Text(aType.title)
            }
        }
        .fixedSize()
    }
}

struct IndexTypePicker_Previews: PreviewProvider {
    static var previews: some View {
        IndexTypePicker(type: .constant(.both))
    }
}
