//
//  Deadly.swift
//  DodgeIt
//
//  Created by Giuseppe Cosenza on 04/05/25.
//

import SpriteKit

class Deadly: SKSpriteNode {
    
    // MARK: - init
    init() {
        let deadlyObjSize = CGSize(width: 30, height: 30)
        
        super.init(texture: nil, color: .black, size: deadlyObjSize)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setup
    func setup() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        
        physicsBody!.isDynamic = false
        
        physicsBody!.categoryBitMask = PhysicsCategory.Deadly
        physicsBody!.collisionBitMask = PhysicsCategory.None
        physicsBody!.contactTestBitMask = PhysicsCategory.Player
        
    }
}
