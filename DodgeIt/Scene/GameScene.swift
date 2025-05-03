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
    
    
    // MARK - init
    override init(size: CGSize) {
        player = Player()
        ground = Ground(size: size)
        
        super.init(size: size)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - setup
    
    func setup() {
        // box node
        player.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(player)
                
        // ground node
        ground.position = CGPoint(x: size.width / 2, y: ground.size.height / 2)
        addChild(ground)
    }
    
    override func didMove(to view: SKView) {
        // Setup scene
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Called when a touch begins

    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
