//
//  Coin.swift
//  DodgeIt
//
//  Created by Giuseppe Cosenza on 04/05/25.
//

import SpriteKit

class Coin: SKSpriteNode {
    
    // MARK: init
    init() {
        let size = 20
        super.init(texture: nil, color: .yellow, size: CGSize(width: size, height: size))
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    func setup() {
        name = "coin"
        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        
        physicsBody!.isDynamic = false
        
        physicsBody!.categoryBitMask = PhysicsCategory.Coin
        physicsBody!.collisionBitMask = PhysicsCategory.Ground
        physicsBody!.contactTestBitMask = PhysicsCategory.Player
    }
}
