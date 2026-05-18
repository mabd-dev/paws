//
//  AboutWindow.swift
//  paws
//
//  Created by Mahmoud Abdallah on 18/05/2026.
//
import SwiftUI
struct AboutView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(.appIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            
            Text("Paws")
                .font(.title.bold())
            
            Text("Version \(appVersion)")
                .font(.callout)
                .foregroundStyle(.secondary)
            
            Text("Pause your keyboard. Wipe in peace.")
                .font(.body)
                .multilineTextAlignment(.center)
            
            Text("© 2026 Paws.")
                .font(.footnote)
                .foregroundStyle(.secondary)
            
            HStack(spacing: 8) {
                Link("view on github", destination: URL(string: "https://github.com/mabd-dev/paws")!)
                Text("·")
                    .foregroundStyle(.secondary)
                
                Link("mabd.dev", destination: URL(string: "https://mabd.dev")!)
            }
            .font(.callout)
        }
        .padding(24)
        .frame(width: 300, height: 350)
    }
    
    var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0"
    }
}

#Preview {
    AboutView()
}
