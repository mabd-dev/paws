//
//  SettingsView.swift
//  paws
//
//  Created by Mahmoud Abdallah on 04/06/2026.
//


import SwiftUI

struct SettingsView: View {
    @Environment(PawsSettings.self) private var settings

    var body: some View {
        @Bindable var settings = settings

        VStack(alignment: .leading, spacing: 0) {
            
            // MARK: - Behaviour
            SettingsSectionHeader("Behaviour")
            
            SettingsCard {
                SettingsRow(
                    icon: "lock.fill",
                    iconColor: .blue,
                    title: "Auto Lock on Start",
                    subtitle: "Lock keyboard when Paws launches"
                ) {
                    Toggle("", isOn: $settings.autoLockOnStart)
                        .labelsHidden()
                        .toggleStyle(.switch)
                }
            }
            
        }
        .padding(20)
        .frame(width: 420)
        .navigationTitle("Settings")
    }
}

// MARK: - Reusable components

private struct SettingsSectionHeader: View {
    let title: String
    init(_ title: String) { self.title = title }

    var body: some View {
        Text(title.uppercased())
            .font(.system(size: 11, weight: .medium))
            .foregroundStyle(.secondary)
            .padding(.leading, 4)
            .padding(.bottom, 6)
    }
}

private struct SettingsCard<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        VStack(spacing: 0) {
            content
        }
        .background(.quaternary.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(.separator, lineWidth: 0.5)
        )
        .padding(.bottom, 20)
    }
}

private struct SettingsRow<Control: View>: View {
    let icon: String
    let iconColor: Color
    let title: String
    let subtitle: String
    @ViewBuilder let control: Control

    var body: some View {
        HStack(spacing: 12) {
            // Icon badge
            RoundedRectangle(cornerRadius: 6)
                .fill(iconColor.gradient)
                .frame(width: 28, height: 28)
                .overlay(
                    Image(systemName: icon)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(.white)
                )

            // Label
            VStack(alignment: .leading, spacing: 1) {
                Text(title)
                    .font(.system(size: 13))
                Text(subtitle)
                    .font(.system(size: 11))
                    .foregroundStyle(.secondary)
            }

            Spacer()

            control
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
    }
}
