//
//  Background.swift
//  DodgeIt
//
//  Created by Giuseppe Cosenza on 03/05/25.
//

import SpriteKit

class Background: SKNode {
    let background: SKSpriteNode
    let size: CGSize
    
    let contentNode: SKNode
    
    let ground: Ground
    
    // MARK: - init
    init(size: CGSize) {
        self.size = size
        
//        let hue = CGFloat(arc4random() % 1000) / 1000
//        let color = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
        background = SKSpriteNode(color: .clear, size: size)
        
        ground = Ground(size: size)
        
        contentNode = SKNode()
        
        super.init()
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    func setup() {
        addChild(background)
        background.anchorPoint = .zero
        background.color = generateRandomColor()
        
        // ground node
        addChild(ground)
        ground.position = CGPoint(x: size.width / 2, y: ground.size.height / 2)
        ground.zPosition = 1
        
        addChild(contentNode)
    }
    
    // MARK: - Helpers
    func resetBackground() {
        background.color = generateRandomColor()
        
        contentNode.removeAllChildren()
        
        let n = arc4random() % 2
        
        switch n {
        case 0:
            let coin = Coin()
            contentNode.addChild(coin)
            
            coin.position = CGPoint(
                x: CGFloat(arc4random() % UInt32(size.width)),
                y: CGFloat(arc4random() % UInt32(size.height - ground.size.height)) + 40
            )
        case 1:
            let deadly = Deadly()
            contentNode.addChild(deadly)
            
            deadly.position = CGPoint(
                x: CGFloat(arc4random() % UInt32(size.width - deadly.size.width)) + deadly.size.width / 2,
                y: CGFloat(arc4random() % UInt32(size.height - ground.size.height)) + 40
            )
        default:
            break
        }
        
        
    }
    
    func generateRandomColor() -> UIColor {
        let hue = CGFloat(arc4random() % 1000) / 1000
        return UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
    }
}
