//
//  GameScene.swift
//  DodgeIt
//
//  Created by Giuseppe Cosenza on 03/05/25.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let player: Player
    let ground: Ground
    let cameraPlayer: SKCameraNode
    
    var touching: Bool = false
    
    // MARK - init
    override init(size: CGSize) {
        player = Player()
        ground = Ground(size: size)
        cameraPlayer = SKCameraNode()
        
        super.init(size: size)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - setup
    func setup() {
        // box node
        addChild(player)
        player.position = CGPoint(x: size.width / 2, y: size.height / 2)
                
        // ground node
        addChild(ground)
        ground.position = CGPoint(x: size.width / 2, y: ground.size.height / 2)
        
        // cameraPlayer node
        addChild(cameraPlayer)
        camera = cameraPlayer
        cameraPlayer.position = player.position
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
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if touching {
            player.physicsBody?.applyForce(CGVector(dx: .zero, dy: 150))
        }
    
        player.physicsBody?.applyForce(CGVector(dx: 30, dy: .zero))
        
        camera?.position.x = player.position.x
    }
}
