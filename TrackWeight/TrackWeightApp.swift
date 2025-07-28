//
//  TrackWeightApp.swift
//  TrackWeight
//
//  Created by Takuto Nakamura on 2024/03/02.
//

import SwiftUI

@main
struct TrackWeightApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var unitSettings = UnitSettings()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(unitSettings)
        }
    }
}

final class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool { true }
}
