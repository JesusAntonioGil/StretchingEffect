//
//  AppDetailView.swift
//  StretchingEffect
//
//  Created by Jesus Antonio Gil on 11/2/25.
//

import SwiftUI

struct AppDetailsScreen: View {
    let app: AppType
    @State private var scrollOffsetY: CGFloat = .zero
    @State private var navBarAppIconVisible: Bool = false
    
    
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(spacing: 0) {
                    Image(app.iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    
                    Text(app.title)
                        .font(.title)
                        .bold()
                        .padding(.top, 8)
                        .foregroundStyle(.white)
                        .padding(.top, calculateExtraPadding())
                    
                    HStack {
                        Group {
                            Button {
                                print("Button Install Tapped")
                            } label: {
                                Text("Install")
                                    .bold()
                                    .frame(maxWidth: .infinity)
                            }
                            
                            Button {
                                print("Button Send Feedback Tapped")
                            } label: {
                                Text("Send Feedback")
                                    .bold()
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .padding()
                        .background(.ultraThinMaterial.opacity(0.7))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .tint(.primary)
                    }
                    .foregroundStyle(.white)
                    .padding([.top, .horizontal], 24)
                    .padding(.top, calculateExtraPadding())
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 60)
                .padding(.vertical, 40)
                .background(BackgroundImage())
                
                Group {
                    InfoSection
                    
                    Text("What to test")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    Text(app.description)
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.init(uiColor: .secondarySystemGroupedBackground))
                        }
                        .padding(.horizontal)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .ignoresSafeArea()
        .onScrollGeometryChange(for: CGFloat.self, of: { proxy in
            proxy.contentOffset.y + proxy.contentInsets.top
        }, action: { _, newValue in
            scrollOffsetY = newValue
        })
        .onChange(of: scrollOffsetY, { _, newValue in
            navBarAppIconVisible = newValue > 5
        })
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image(app.iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .opacity(navBarAppIconVisible ? 1 : 0)
                    .animation(.smooth(duration: 0.1), value: navBarAppIconVisible)
            }
        }
    }
    
    private var InfoSection: some View {
        HStack {
            VStack(alignment: .center, spacing: 8) {
                Text("DEVELOPER")
                    .fontWeight(.semibold)
                
                Image(systemName: "person.crop.square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                
                Text(app.developer)
            }
            .frame(maxWidth: .infinity)
            
            Divider()
            
            VStack(alignment: .center, spacing: 8) {
                Text("CATEGORY")
                    .fontWeight(.semibold)
                
                Image(systemName: "bubble.left.and.bubble.right.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                Text(app.category)
            }
            .frame(maxWidth: .infinity)
            
            Divider()
            
            VStack(alignment: .center, spacing: 8) {
                Text("EXPIRES")
                    .fontWeight(.semibold)
                
                Text("\(app.expirationDays)")
                    .font(.headline)
                    .frame(height: 20)
                
                Text("Days")
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .padding()
        .background(Color.init(uiColor: .secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.vertical)
        .padding(.horizontal, 8)
        .lineLimit(1)
        .foregroundStyle(.secondary)
        .font(.caption)
    }
    
    
    @ViewBuilder
    private func BackgroundImage() -> some View {
        let additionalHeight: CGFloat = max(0, -scrollOffsetY)
        
        GeometryReader { proxy in
            Image(app.iconName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 50)
                .overlay {
                    Rectangle()
                        .fill(.black.opacity(0.4))
                }
                .clipped()
                .offset(y: min(0, scrollOffsetY))
                .frame(width: proxy.size.width, height: proxy.size.height + additionalHeight)
        }
    }
    
    private func calculateExtraPadding() -> CGFloat {
        max(0, -scrollOffsetY) * 0.15
    }
}



#Preview {
    @Previewable @StateObject var coordinator = NavigationCoordinator()
    NavigationStack(path: $coordinator.route) {
        AppsView()
            .environmentObject(coordinator)
            .onAppear { coordinator.push(.appDetails(.instagram)) }
            .navigationDestination(for: NavigationRoute.self) {
                coordinator.handleDestination($0)
                    .environmentObject(coordinator)
            }
    }
    .tint(.primary)
}

