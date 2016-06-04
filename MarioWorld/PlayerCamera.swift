//
//  Camera.swift
//  2DGame
//
//  Created by Internicola, Eric on 6/3/16.
//  Copyright © 2016 iColasoft. All rights reserved.
//

import SpriteKit

class PlayerCamera: SKCameraNode {
    var player: SKNode!

}

// MARK: - Update Method

extension PlayerCamera {

    override func update() {
        position = CGPoint(x: player.position.x, y: player.position.y + 20)
    }

    override func configureNode() {
        let action = SKAction.scaleTo(0.25, duration: 1)
        runAction(action)
    }

}

