//
//  PawsSettings.swift
//  paws
//
//  Created by Mahmoud Abdallah on 04/06/2026.
//

import SwiftUI

@Observable
class PawsSettings {
    var autoLockOnStart: Bool {
        didSet {
            UserDefaults.standard.set(autoLockOnStart, forKey: "autoLockOnStart")
        }
    }

    init() {
        self.autoLockOnStart = UserDefaults.standard.bool(forKey: "autoLockOnStart")
    }
}
