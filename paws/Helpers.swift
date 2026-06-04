//
//  Helpers.swift
//  paws
//
//  Created by Mahmoud Abdallah on 04/06/2026.
//

import SwiftUI

/// @return true is permission is granted
func checkAccessibilityPermission() -> Bool {
    let options = [kAXTrustedCheckOptionPrompt.takeUnretainedValue(): true] as CFDictionary
    return AXIsProcessTrustedWithOptions(options)
}
