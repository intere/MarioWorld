//
//  CollisionManager.swift
//  2DGame
//
//  Created by Eric Internicola on 6/3/16.
//  Copyright © 2016 iColasoft. All rights reserved.
//

import SpriteKit

class CollisionManager: NSObject {
    static let sharedManager = CollisionManager()


}

// MARK: - SKPhysicsContactDelegate Methods

extension CollisionManager: SKPhysicsContactDelegate {

    func didBeginContact(contact: SKPhysicsContact) {
        guard let player: Player = getCollisionNode(contact) else {
//        guard let player = contact.bodyA.node as? Player ?? contact.bodyB.node as? Player else {
            print("Non-Player collision")
            return
        }

        print("Player Collision: \(player)")

    }

}

// MARK: - Helpers

extension CollisionManager {

    func getCollisionNode<T>(contact: SKPhysicsContact) -> T? {
        guard let result = contact.bodyA.node as? T ?? contact.bodyB.node as? T else {
            return nil
        }

        return result
    }

}
