//
//  GameScene.swift
//  DodgeIt
//
//  Created by Giuseppe Cosenza on 03/05/25.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    let player: Player
    let cameraPlayer: SKCameraNode
    
    var backgrounds = [Background]()
    
    var touching: Bool = false
    
    var lastUpdateTime: CFTimeInterval = 0
    
    // MARK: - init
    override init(size: CGSize) {
        player = Player()
        cameraPlayer = SKCameraNode()
        
        super.init(size: size)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    func setup() {
        physicsWorld.contactDelegate = self
        
        let centerPoint = CGPoint(x: size.width / 2, y: size.height / 2)
        
        // box node
        addChild(player)
        player.position = centerPoint
        player.zPosition = 99
                        
        // cameraPlayer node
        addChild(cameraPlayer)
        camera = cameraPlayer
        cameraPlayer.position = centerPoint
            
        for i in 0..<2 {
            let background = Background(size: size)
            background.position.x = CGFloat(i) * size.width
            backgrounds.append(background)
            addChild(background)
        }
    }
    
    override func didMove(to view: SKView) {
        // Setup scene
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Called when a touch begins
        touching = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Called when a touch ends
        touching = false
    }
    
    // MARK: - update
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    
        var deltaTime = currentTime - lastUpdateTime
        
        if deltaTime > 1 {
            deltaTime = 1 / 60
        }
        
        if touching {
            player.physicsBody?.applyForce(CGVector(dx: .zero, dy: 150))
        }
        
        player.position.x += 200 * deltaTime
        
        camera?.position.x = player.position.x
        
        scrollBackgrounds()
    }
    
    func scrollBackgrounds() {
        for background in backgrounds {
            let dx = background.position.x - cameraPlayer.position.x
            
            if dx < -(background.size.width + size.width / 2) {
                background.position.x += background.size.width * 2
                
                background.resetBackground()
            }
        }
    }
    
    // MARK: - Physics Delegate
    func didBegin(_ contact: SKPhysicsContact) {
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collision == PhysicsCategory.Coin | PhysicsCategory.Player {
            print("** Collision detected! **")
        }
    }
}
