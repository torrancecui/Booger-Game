//
//  GameScene.swift
//  Booger
//
//  Created by Torrance Cui on 7/3/20.
//  Copyright © 2020 Torrance Cui. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var player = SKSpriteNode()
    var enemy = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        player = self.childNode(withName: "playerPaddle") as! SKSpriteNode
        enemy = self.childNode(withName: "enemyPaddle") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy:20))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
    }
    
    override func update(_ currentTime: TimeInterval){
        
    }
}
