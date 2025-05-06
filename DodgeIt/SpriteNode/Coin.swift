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
        let coinSize = CGSize(width: 30, height: 30)
        
        super.init(texture: nil, color: .yellow, size: coinSize)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    func setup() {
        name = "coin"
        
        texture = coinTexture
        
        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        
        physicsBody!.isDynamic = false
        
        physicsBody!.categoryBitMask = PhysicsCategory.Coin
        physicsBody!.collisionBitMask = PhysicsCategory.Ground
        physicsBody!.contactTestBitMask = PhysicsCategory.Player
    }
    
    // MARK: - textures
    private var coinAtlas: SKTextureAtlas {
        return SKTextureAtlas(named: "coin")
    }
    
    private var coinTexture: SKTexture {
        return coinAtlas.textureNamed("idle-1")
    }
    
    private var coinIdleTextures: [SKTexture] {
        var textures: [SKTexture] = []
        
        for i in 1...8 {
            textures.append(coinAtlas.textureNamed("idle-\(i)"))
        }
        
        return textures
    }
    
    func startIdleAnimation() {
        let walkAnimation = SKAction.animate(with: coinIdleTextures, timePerFrame: 0.3)
        
        run(SKAction.repeatForever(walkAnimation), withKey: "coinIdleAnimation")
    }
}
