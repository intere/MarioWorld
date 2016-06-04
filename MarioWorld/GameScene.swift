//
//  GameScene.swift
//  MarioWorld
//
//  Created by Eric Internicola on 6/4/16.
//  Copyright (c) 2016 Eric Internicola. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    var player: Mario!
    var playerCamera: PlayerCamera!

    override func didMoveToView(view: SKView) {

        for node in children {
            if let node = node as? Mario {
                player = node
            } else if let node = node as? PlayerCamera {
                playerCamera = node
            }
        }

        assert( player != nil, "We don't have a Player Node")

        setupCamera()
        configureNodes()
    }

    override func mouseDown(theEvent: NSEvent) {
        //        /* Called when a mouse click occurs */
        //
        //        let location = theEvent.locationInNode(self)
        //
        //        let sprite = SKSpriteNode(imageNamed:"Spaceship")
        //        sprite.position = location;
        //        sprite.setScale(0.5)
        //
        //        let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
        //        sprite.runAction(SKAction.repeatActionForever(action))
        //
        //        self.addChild(sprite)

        let zoomInAction = SKAction.scaleBy(0.5, duration: 1)
        playerCamera.runAction(zoomInAction)

        print("Camera Zoom: ", playerCamera.xScale, playerCamera.yScale)
    }

    override func keyDown(theEvent: NSEvent) {
        guard theEvent.modifierFlags.contains(.NumericPadKeyMask) else {
            return
        }
        guard let arrow = theEvent.charactersIgnoringModifiers else {
            return
        }
        let keys = NSString(string: arrow)

        if hasJump(keys) {
            if hasMoveLeft(keys) {
                print("Jump Left")
            } else if hasMoveRight(keys) {
                print("Jump Right")
            } else {
                print("Jump")
                player.jump()
            }
        } else {
            if hasMoveLeft(keys) {
                print("Move Left")
                player.moveLeft()
            } else if hasMoveRight(keys) {
                print("Move Right")
                player.moveRight()
            }
        }

    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        for node in children {
            node.update()
        }
    }
}

// MARK: - Setup Methods

extension GameScene {

    func configureNodes() {
        physicsWorld.contactDelegate = CollisionManager.sharedManager
        for node in children {
            node.configureNode()
            node.configurePhysics()
        }
    }

    func setupCamera() {
        playerCamera = PlayerCamera()
        playerCamera.player = player
        addChild(playerCamera)

        camera = playerCamera
    }

}

// MARK: - Helpers

private extension GameScene {

    func hasJump(string: NSString) -> Bool {
        return hasKey(string, keyCode: NSUpArrowFunctionKey)
    }

    func hasMoveLeft(string: NSString) -> Bool {
        return hasKey(string, keyCode: NSLeftArrowFunctionKey)
    }

    func hasMoveRight(string: NSString) -> Bool {
        return hasKey(string, keyCode: NSRightArrowFunctionKey)
    }

    func hasKey(string: NSString, keyCode: Int) -> Bool {

        for i in 0..<string.length {
            if Int(string.characterAtIndex(i)) == keyCode {
                return true
            }
        }
        
        return false
    }
    
}
