//
//  ContentView.swift
//  paws
//
//  Created by Mahmoud Abdallah on 16/05/2026.
//

import SwiftUI

struct MenuBarView: View {
    var body: some View {
        VStack {
            Text("Paws")
                .foregroundStyle(.secondary)
            
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
        .padding()
    }
}

#Preview {
    MenuBarView()
}
