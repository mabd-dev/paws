//
//  ContentView.swift
//  paws
//
//  Created by Mahmoud Abdallah on 16/05/2026.
//

import SwiftUI

struct MenuBarView: View {
    
    @Environment(\.openWindow) var openWindow
    @Environment(KeyboardLockManager.self) var keyboardLockManager: KeyboardLockManager

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Paws")
                .foregroundStyle(.secondary)
            
            Button(
                action: {
                    if keyboardLockManager.locked {
                        keyboardLockManager.unlock()
                    } else {
                        if !checkAccessibilityPermission() {
                            // user would get a default permission popup
                        } else {
                            keyboardLockManager.lock()
                        }
                    }
                },
                label: {
                    Label(
                        keyboardLockManager.locked ? "Unlock Keyboard" : "Lock Keyboard",
                        systemImage: keyboardLockManager.locked ? "lock.fill" : "lock.open.fill"
                    )
                    .foregroundStyle(keyboardLockManager.locked ? .red : .primary)
                },
            )
            .contentTransition(.symbolEffect(.replace))
            .buttonStyle(MenuRowButtonStyle())
            .padding(.top, 8)
            
            Divider()
                .padding(.vertical, 4)
            
            SettingsLink {
                Text("Settings...")
            }
            .buttonStyle(MenuRowButtonStyle())

            Button("About Paws") {
                NSApp.activate(ignoringOtherApps: true)
                openWindow(id: "about")
            }
            .buttonStyle(MenuRowButtonStyle())
            
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
            .buttonStyle(MenuRowButtonStyle())
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .frame(width: 200)
    }
    
    func checkAccessibilityPermission() -> Bool {
        let options = [kAXTrustedCheckOptionPrompt.takeUnretainedValue(): true] as CFDictionary
        return AXIsProcessTrustedWithOptions(options)
    }
}


struct MenuRowButtonStyle: ButtonStyle {
    @State private var isHovered = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .background(isHovered ? Color.accentColor.opacity(0.5) : .clear)
            .cornerRadius(6)
            .onHover { isHovered = $0 }
    }
}


#Preview {
    let keyboardLockManager = KeyboardLockManager()
    MenuBarView()
        .environment(keyboardLockManager)
}
