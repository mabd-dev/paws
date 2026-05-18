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
    }
}
