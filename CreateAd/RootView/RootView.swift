//
//  ContentView.swift
//  CreateAd
//
//  Created by Dimitrios Tsoumanis on 21/03/2024.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationStack {
            CreateAdView()
                .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

#Preview {
    RootView()
}
