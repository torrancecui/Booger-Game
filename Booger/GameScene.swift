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
    
    var score = [Int]()
    
    var playerScore = SKLabelNode()
    var enemyScore = SKLabelNode()
    
    override func didMove(to view: SKView) {
        
        startGame()
        
        enemyScore = self.childNode(withName: "enemyScore") as! SKLabelNode
        playerScore = self.childNode(withName: "playerScore") as! SKLabelNode
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        player = self.childNode(withName: "playerPaddle") as! SKSpriteNode
        enemy = self.childNode(withName: "enemyPaddle") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy:20))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
    }
    
    func startGame() {
        score = [0,0]
        
        enemyScore.text = "\(score[1])"
        playerScore.text = "\(score[0])"
    }
    
    func addScore(playerWhoWon: SKSpriteNode){
        
        ball.position = CGPoint(x:0, y:0)
        ball.physicsBody?.velocity = CGVector(dx:0, dy:0)
        
        if playerWhoWon == player{
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy:20))
        } else if playerWhoWon == enemy{
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy:-20))
        }
        
        enemyScore.text = "\(score[1])"
        playerScore.text = "\(score[0])"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            player.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    override func touchesMoved(_ touches:Set<UITouch>, with event: UIEvent?){
        for touch in touches {
            let location = touch.location(in: self)
            
            player.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
    }
    
    
    override func update(_ currentTime: TimeInterval){
        enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
        
        if ball.position.y <= player.position.y - 70 {
            addScore(playerWhoWon: enemy)
        }else if ball.position.y >= enemy.position.y + 70{
            addScore(playerWhoWon: player)

        }
    }
}
