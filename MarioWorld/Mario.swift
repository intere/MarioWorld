//
//  Sprites.swift
//  2DGame
//
//  Created by Internicola, Eric on 6/2/16.
//  Copyright © 2016 iColasoft. All rights reserved.
//

import SpriteKit

class Mario: SKSpriteNode {

}

// MARK: - API

extension Mario : Player {

    func jump() {
        guard let jump = SKAction(named: "PlayerJump") else {
            print("ERROR: Couldn't load PlayerJump action")
            return
        }
        runAction(jump)
    }

    func moveLeft() {
        turnLeft()
        guard let moveLeft = SKAction(named: "MoveLeft") else {
            print("ERROR: Couldn't load MoveLeft action")
            return
        }
        runAction(moveLeft)

    }

    func moveRight() {
        turnRight()
        guard let moveRight = SKAction(named: "MoveRight") else {
            print("ERROR: Couldn't load MoveRight action")
            return
        }

        runAction(moveRight)
    }

    func die() {
        removeAllActions()
        guard let die = SKAction(named: "PlayerDie") else {
            print("ERROR: Couldn't load Die action")
            return
        }
        runAction(die)
    }

}

// MARK: - Overrides

extension Mario {

    override func configurePhysics() {
        physicsBody?.categoryBitMask = GamePhysics.Player.rawValue
        physicsBody?.contactTestBitMask = GamePhysics.DeadlyTouch.rawValue
    }

}

// MARK: - Helpers

private extension Mario {

    func turnLeft() {
        runAction(SKAction.scaleXTo(-1, duration: 0.01))
    }

    func turnRight() {
        runAction(SKAction.scaleTo(1, duration: 0.01))
    }

}