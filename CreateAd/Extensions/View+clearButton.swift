//
//  View+clearButton.swift
//  CreateAd
//
//  Created by Dimitrios Tsoumanis on 22/03/2024.
//

import Foundation
import SwiftUI

extension View {
    func showClearButton(_ text: Binding<String>) -> some View {
        self.modifier(TextFieldClearButton(fieldText: text))
    }
}
