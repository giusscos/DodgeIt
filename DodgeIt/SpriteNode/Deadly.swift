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
//        let width = CGFloat(arc4random() % 4) * 20 + 20
//        let height = CGFloat(arc4random() % 4) * 20 + 20
        let width = 40
        let height = 40
        let size = CGSize(width: width, height: height)
        
        super.init(texture: nil, color: .black, size: size)
        
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
