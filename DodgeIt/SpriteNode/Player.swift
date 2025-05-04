//
//  Player.swift
//  DodgeIt
//
//  Created by Giuseppe Cosenza on 03/05/25.
//

import SpriteKit

class Player: SKSpriteNode {
    
    // MARK: - init
    init () {
        let playerSize = CGSize(width: 30, height: 60)
        
        super.init(texture: nil, color: .red, size: playerSize)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    
    func setup() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
    }
}
