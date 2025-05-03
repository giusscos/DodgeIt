//
//  Player.swift
//  DodgeIt
//
//  Created by Giuseppe Cosenza on 03/05/25.
//

import SpriteKit

class Player: SKSpriteNode {
    
    init () {
        let playerSize = CGSize(width: 30, height: 60)
        
        super.init(texture: nil, color: .red, size: playerSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - setup
    
    func setup() {}
}
