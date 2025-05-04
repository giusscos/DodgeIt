//
//  PhysicsCategory.swift
//  DodgeIt
//
//  Created by Giuseppe Cosenza on 04/05/25.
//

import Foundation

struct PhysicsCategory {
    static let None: UInt32 = 0         // 0000
    static let Player: UInt32 = 0b1     // 0001
    static let Ground: UInt32 = 0b10    // 0010
    static let Coin: UInt32 = 0b100     // 0100
}
