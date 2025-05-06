//
//  Ground.swift
//  DodgeIt
//
//  Created by Giuseppe Cosenza on 03/05/25.
//

import SpriteKit

class Ground: SKSpriteNode {
    
    // MARK: - init
    init(size: CGSize) {
        let groundSize = CGSize(width: size.width, height: 40)
        
        super.init(texture: nil, color: .brown, size: groundSize)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    func setup() {
        name = "ground"
        
        texture = groundTexture
        texture!.filteringMode = .nearest
        
        physicsBody = SKPhysicsBody(rectangleOf: size)
        
        physicsBody!.isDynamic = false
        
        physicsBody!.categoryBitMask = PhysicsCategory.Ground
        physicsBody!.collisionBitMask = PhysicsCategory.Player
        physicsBody!.contactTestBitMask = PhysicsCategory.None
    }
    
    // MARK: - textures
    private var groundAtlas: SKTextureAtlas {
        return SKTextureAtlas(named: "ground")
    }
    
    private var groundTexture: SKTexture {
        return groundAtlas.textureNamed("ground-1")
    }
}
