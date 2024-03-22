//
//  CustomButton.swift
//  CreateAd
//
//  Created by Dimitrios Tsoumanis on 22/03/2024.
//

import Foundation
import SwiftUI

struct CustomButton: ButtonStyle {
    let backgroundColor: Color
    @Binding var formIsValid: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor)
            .cornerRadius(8.0)
            .foregroundStyle(.white)
            .bold()
            .opacity(formIsValid ? 1 : 0.5)
            .disabled(!formIsValid)
    }
}
