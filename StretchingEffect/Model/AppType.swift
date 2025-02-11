//
//  AppType.swift
//  StretchingEffect
//
//  Created by Jesus Antonio Gil on 11/2/25.
//

import Foundation


enum AppType: String, CaseIterable {
    case telegram
    case whatsapp
    case youtube
    case instagram
    case facebook
    
    var iconName: String {
        "\(rawValue)_app_icon"
    }
    
    var title: String {
        switch self {
            case .telegram: "Telegram"
            case .whatsapp: "WhatsApp"
            case .youtube: "YouTube"
            case .instagram: "Instagram"
            case .facebook: "Facebook"
        }
    }
    
    var version: String {
        switch self {
            case .telegram: "9.2.1 (1234)"
            case .whatsapp: "2.23.18 (5678)"
            case .youtube: "18.34.5 (9101)"
            case .instagram: "305.0.0 (1122)"
            case .facebook: "401.1.0 (3344)"
        }
    }
    
    var expiration: String {
        return "Expires in \(expirationDays) days"
    }
    
    var expirationDays: Int {
        switch self {
            case .telegram: 15
            case .whatsapp: 30
            case .youtube: 7
            case .instagram: 20
            case .facebook: 10
        }
    }
    
    var developer: String {
        switch self {
            case .telegram: "Telegram FZ-LLC"
            case .whatsapp: "Meta Platforms, Inc."
            case .youtube: "Google LLC"
            case .instagram: "Meta Platforms, Inc."
            case .facebook: "Meta Platforms, Inc."
        }
    }
    
    var category: String {
        switch self {
            case .telegram: "Messaging"
            case .whatsapp: "Social Networking"
            case .youtube: "Video Sharing"
            case .instagram: "Photo & Video"
            case .facebook: "Social Networking"
        }
    }
    
    var description: String {
        switch self {
            case .telegram: "Test messaging speed, group chats, and media sharing features."
            case .whatsapp: "Check the performance of voice and video calls, and privacy settings."
            case .youtube: "Ensure smooth video playback, comment system, and notifications."
            case .instagram: "Test photo uploads, stories, reels, and messaging functionality."
            case .facebook: "Verify news feed performance, profile updates, and group interactions."
        }
    }
}

