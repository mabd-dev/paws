//
//  ContentView.swift
//  paws
//
//  Created by Mahmoud Abdallah on 16/05/2026.
//

import SwiftUI

struct MenuBarView: View {
    
    @State private var locked = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Paws")
                .foregroundStyle(.secondary)
            
            Divider()
                .padding(.vertical, 4)

            Button(
                action: {
                    if locked {
                        locked.toggle()
                    } else {
                        if !checkAccessibilityPermission() {
                            // user would get a default permission popup
                            print("accessibility: not trusted")
                        } else {
                            lockKeyboard()
                            locked.toggle()
                        }
                    }
                },
                label: {
                    Label(
                        locked ? "Unlock Keyboard" : "Lock Keyboard",
                        systemImage: locked ? "lock.open.fill" : "lock.fill"
                    )
                },
            )
            .contentTransition(.symbolEffect(.replace))
            .buttonStyle(MenuRowButtonStyle())
            
            Divider()
                .padding(.vertical, 4)

            Button("About") {
                print("open about page ")
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
        print("requesting accessibility permission")
        let options = [kAXTrustedCheckOptionPrompt.takeUnretainedValue(): true] as CFDictionary
        return AXIsProcessTrustedWithOptions(options)
    }
    
    func lockKeyboard() {
        // TODO: to be implemented
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
    MenuBarView()
}
