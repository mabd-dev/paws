//
//  pawsApp.swift
//  paws
//
//  Created by Mahmoud Abdallah on 16/05/2026.
//

import SwiftUI

@main
struct pawsApp: App {
    @State var keyboardLockManager = KeyboardLockManager()
    @State var settings = PawsSettings()
    
    init() {
        let trusted = checkAccessibilityPermission(showPermissionRequest: false)
        
        if trusted && settings.autoLockOnStart {
            keyboardLockManager.lock()
        }
    }

    var body: some Scene {
        MenuBarExtra(
            content: {
                MenuBarView()
                    .environment(keyboardLockManager)
            },
            label: {
                Image(keyboardLockManager.locked ? .pawsActive : .pawsIdle)
                    .resizable()
                    .scaledToFit()
            }
        )
        .menuBarExtraStyle(.window)
        
        Window(
            "About Paws",
            id: "about",
            content: { AboutView() }
        )
        .windowResizability(.contentSize)
        
        Settings {
            SettingsView()
                .environment(settings)
        }
    }
}
