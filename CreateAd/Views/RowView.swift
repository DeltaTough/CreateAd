//
//  RowView.swift
//  CreateAd
//
//  Created by Dimitrios Tsoumanis on 22/03/2024.
//

import Foundation
import SwiftUI

struct RowView: View {
    let sectionName: String
    var lineLimit: PartialRangeFrom<Int>? = nil
    @Binding var typingElement: String
    @FocusState private var isTextFieldFocused: Bool

    private let rowColor = Color(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0)
    
    var body: some View {
        Section {
            TextField("Type something...", text: $typingElement, axis: .vertical)
                .padding()
                .background(rowColor)
                .cornerRadius(8.0)
                .lineLimit(lineLimit ?? 0...)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .focused($isTextFieldFocused)
                .showClearButton($typingElement)
        } header: {
            Text(sectionName).bold()
        }
    }
}
