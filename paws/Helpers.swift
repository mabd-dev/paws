//
//  Helpers.swift
//  paws
//
//  Created by Mahmoud Abdallah on 04/06/2026.
//

import SwiftUI

/// @param showPermissionRequest if true, it will automatically open settings if not trusted
/// @return true is permission is granted
func checkAccessibilityPermission(showPermissionRequest: Bool = true) -> Bool {
    let options = [kAXTrustedCheckOptionPrompt.takeUnretainedValue(): showPermissionRequest] as CFDictionary
    return AXIsProcessTrustedWithOptions(options)
}
