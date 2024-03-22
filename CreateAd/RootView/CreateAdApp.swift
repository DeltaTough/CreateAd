//
//  CreateAdApp.swift
//  CreateAd
//
//  Created by Dimitrios Tsoumanis on 21/03/2024.
//

import SwiftUI

@main
struct CreateAdApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
    
}
