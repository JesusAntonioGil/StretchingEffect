//
//  StretchingEffectApp.swift
//  StretchingEffect
//
//  Created by Jesus Antonio Gil on 11/2/25.
//

import SwiftUI

@main
struct StretchingEffectApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(destinationHandler: NavigationCoordinator())
        }
    }
}
