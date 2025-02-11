//
//  NavigationCoordinator.swift
//  StretchingEffect
//
//  Created by Jesus Antonio Gil on 11/2/25.
//

import SwiftUI


final class NavigationCoordinator: Coordinator & DestinationNavigable {
    @Published var route: [NavigationRoute] = []
}
