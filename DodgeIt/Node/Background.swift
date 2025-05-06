//
//  Background.swift
//  DodgeIt
//
//  Created by Giuseppe Cosenza on 03/05/25.
//

import SpriteKit
import GameplayKit

class Background: SKNode {
    let background: SKSpriteNode
    let size: CGSize
    
    let contentNode: SKNode
    
    let ground: Ground
    
    // MARK: - init
    init(size: CGSize) {
        self.size = size
        
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
    
    // MARK: - helpers
    func resetBackground() {
        background.color = generateRandomColor()
        
        contentNode.removeAllChildren()
        
        let randomSource = GKARC4RandomSource()
        let numberOfObjectDist = GKRandomDistribution(randomSource: randomSource, lowestValue: 1, highestValue: 5)
        let objectTypeDist = GKRandomDistribution(randomSource: randomSource, lowestValue: 0, highestValue: 1)
        let xPositionDist = GKRandomDistribution(randomSource: randomSource, lowestValue: 0, highestValue: Int(size.width))
        let yPositionDist = GKRandomDistribution(randomSource: randomSource, lowestValue: 40, highestValue: Int(size.height - ground.size.height))
        
        let numberOfObject = numberOfObjectDist.nextInt()
        var usedPositions: [CGPoint] = []
        let minimumDistance: CGFloat = 50.0  // Adjust based on how close is "too close"
        
        for _ in 0..<numberOfObject {
            var position: CGPoint
            var attempts = 0
            let maxAttempts = 10
            
            repeat {
                let x = CGFloat(xPositionDist.nextInt())
                let y = CGFloat(yPositionDist.nextInt())
                position = CGPoint(x: x, y: y)
                attempts += 1
            } while isPositionTooClose(position, usedPositions: usedPositions, minimumDistance: minimumDistance) && attempts < maxAttempts
            
            usedPositions.append(position)
            
            let n = objectTypeDist.nextInt()
            
            switch n {
            case 0:
                let coin = Coin()
                contentNode.addChild(coin)
                coin.position = position
                coin.startIdleAnimation()
            case 1:
                let deadly = Deadly()
                contentNode.addChild(deadly)
                deadly.position = position
            default:
                break
            }
        }
    }
    
    func isPositionTooClose(_ position: CGPoint, usedPositions: [CGPoint], minimumDistance: CGFloat) -> Bool {
        for used in usedPositions {
            if position.distance(to: used) < minimumDistance {
                return true
            }
        }
        return false
    }
    
    func generateRandomColor() -> UIColor {
        let hue = CGFloat(arc4random() % 1000) / 1000
        return UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
    }
    
    // MARK: - textures
    private var backgroundAtlas: SKTextureAtlas {
        return SKTextureAtlas(named: "background")
    }
    
    private var backgroundTexture: SKTexture {
        return backgroundAtlas.textureNamed("background-blue-1")
    }
}

extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        let dx = self.x - point.x
        let dy = self.y - point.y
        return sqrt(dx * dx + dy * dy)
    }
}
