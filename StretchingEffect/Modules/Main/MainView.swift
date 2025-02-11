//
//  MainView.swift
//  StretchingEffect
//
//  Created by Jesus Antonio Gil on 11/2/25.
//

import SwiftUI


struct MainView<DestinationHandler: DestinationNavigable>: View {
    @State private var destinationHandler: DestinationHandler
    
    
    init(destinationHandler: DestinationHandler) {
        _destinationHandler = State(initialValue: destinationHandler)
    }
    
    var body: some View {
        NavigationStack(path: $destinationHandler.route) {
            
        }
    }
}



#Preview {
    MainView(destinationHandler: NavigationCoordinator())
}
