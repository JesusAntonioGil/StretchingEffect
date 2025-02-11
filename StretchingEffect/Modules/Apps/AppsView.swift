//
//  AppsView.swift
//  StretchingEffect
//
//  Created by Jesus Antonio Gil on 11/2/25.
//

import SwiftUI


struct AppsView: View {
    @EnvironmentObject private var coordinator: NavigationCoordinator
    @State private var apps: [AppType] = AppType.allCases

    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Header
                
                ForEach(apps, id: \.self) { app in
                    AppCell(app: app)
                        .onTapGesture {
                            coordinator.push(.appDetails(app))
                        }
                }
            }
        }
        .background(.black)
        .navigationTitle("Apps")
    }
    
    
    private var Header: some View {
        Text("Currently Testing")
            .font(.title2)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .foregroundStyle(.white)
    }
    
    
    private func AppCell(app: AppType) -> some View {
        HStack {
            Image(app.iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
                
            VStack(alignment: .leading) {
                Text(app.title)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Group {
                    Text(app.version)
                    Text(app.expiration)
                }
                .font(.caption)
                .foregroundStyle(Color.secondaryText)
            }
            .lineLimit(1)
            
            Spacer()
            
            Button {
                print("Install Button Tapped")
            } label: {
                Text("Install")
                    .bold()
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Color(.cellBackground))
                    .clipShape(.capsule)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(.customBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal)
        .padding(.vertical, 6)
    }
    
    
}



#Preview {
    @Previewable @State var coordinator = NavigationCoordinator()
    NavigationStack(path: $coordinator.route) {
        AppsView()
            .environmentObject(coordinator)
            .navigationDestination(for: NavigationRoute.self) {
                coordinator.handleDestination($0)
                    .environmentObject(coordinator)
            }
    }
    .tint(.white)
}
