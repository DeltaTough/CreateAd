//
//  SheetView.swift
//  CreateAd
//
//  Created by Dimitrios Tsoumanis on 22/03/2024.
//

import Foundation
import SwiftUI

struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let newAd: NewlyCleatedAd

    var body: some View {
        VStack(alignment: .center) {
            Text(newAd.title)
            Text(newAd.location)
            Text(newAd.price ?? "")
            Text(newAd.description ?? "")
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
