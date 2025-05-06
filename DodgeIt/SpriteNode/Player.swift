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
        
        texture = playerTexture
        
        physicsBody = SKPhysicsBody(rectangleOf: size)
        
        physicsBody!.allowsRotation = false
        
        physicsBody!.categoryBitMask = PhysicsCategory.Player
        physicsBody!.collisionBitMask = PhysicsCategory.Ground
        physicsBody!.contactTestBitMask = PhysicsCategory.Coin | PhysicsCategory.Deadly
    }
    
    // MARK: - textures
    private var playerAtlas: SKTextureAtlas {
        return SKTextureAtlas(named: "turtle")
    }
    
    private var playerTexture: SKTexture {
        return playerAtlas.textureNamed("walk-1")
    }
    
    private var playerWalkTextures: [SKTexture] {
        var textures: [SKTexture] = []
        
        for i in 1...6 {
            textures.append(playerAtlas.textureNamed("walk-\(i)"))
        }

        return textures
    }
    
    func startWalkAnimation() {
        let walkAnimation = SKAction.animate(with: playerWalkTextures, timePerFrame: 0.2)
        
        run(SKAction.repeatForever(walkAnimation), withKey: "playerWalkAnimation")
    }
}
