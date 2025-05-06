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
        let playerSize = CGSize(width: 40, height: 40)
        
        super.init(texture: nil, color: .gray, size: playerSize)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    
    func setup() {
        name = "player"
        physicsBody = SKPhysicsBody(rectangleOf: size)

        physicsBody!.allowsRotation = false
        
        physicsBody!.categoryBitMask = PhysicsCategory.Player
        physicsBody!.collisionBitMask = PhysicsCategory.Ground
        physicsBody!.contactTestBitMask = PhysicsCategory.Coin | PhysicsCategory.Deadly
    }
}
