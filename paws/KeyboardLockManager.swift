//
//  KeyboardLockManager.swift
//  paws
//
//  Created by Mahmoud Abdallah on 18/05/2026.
//

import SwiftUI

@Observable
class KeyboardLockManager {
    var locked = false
    
    private var eventTap: CFMachPort?
    
    func lock() {
        let mask = CGEventMask(
            (1 << CGEventType.keyDown.rawValue) |
            (1 << CGEventType.keyUp.rawValue) |
            (1 << CGEventType.flagsChanged.rawValue)  // modifier keys like Cmd, Shift etc
        )
        
        eventTap = CGEvent.tapCreate(
            tap: .cghidEventTap,
            place: .headInsertEventTap,
            options: .defaultTap,
            eventsOfInterest: mask,
            callback: { _, _, _, _ in return nil }, // nil = consume the event,
            userInfo: nil
        )
        
        guard let tap = eventTap else {
            print("Failed to create event tap - accessibility permission missing ?")
            return
        }
        
        let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, tap, 0)
        CFRunLoopAddSource(CFRunLoopGetMain(), runLoopSource, .commonModes)
        CGEvent.tapEnable(tap: tap, enable: true)
        locked = true
    }
    
    func unlock() {
        guard let tap = eventTap else { return }
        
        CGEvent.tapEnable(tap: tap, enable: false)
        eventTap = nil
        locked = false
    }
}
