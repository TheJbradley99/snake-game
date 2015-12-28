//
//  SnakeLocation.swift
//  Snake Game
//
//  Copyright © 2015 Josh Bradley. All rights reserved.
//

import Foundation


class SnakeLocation: NSObject {
    var tail = [Point(X: 0, Y: 0)]
    var size = 0
    var apples = 10
    var score = 0
    
    
    var highScore = NSUserDefaults.standardUserDefaults().integerForKey("highScore")
    var direction: NSString = "start"
    
    func reset(board: GameMap) {
        NSUserDefaults.standardUserDefaults().integerForKey("highScore")
        if score > NSUserDefaults.standardUserDefaults().integerForKey("highScore") {
            NSUserDefaults.standardUserDefaults().setInteger(score, forKey: "highScore")
            NSUserDefaults.standardUserDefaults().synchronize()
            
        }
        highScore = NSUserDefaults.standardUserDefaults().integerForKey("highScore")
        score = 0
        size = 0
        tail = [Point(X:board.sizeX / 2, Y:board.sizeY / 2)]
        
        // Reset apples
        board.apples.removeAll()
        for (var i = 0; i < apples; i++) {
            let appleX = Int(arc4random_uniform(UInt32(board.sizeX - 2)) + 1)
            let appleY = Int(arc4random_uniform(UInt32(board.sizeY - 2)) + 1)
            board.apples.append(Point(X:appleX, Y:appleY))
        }
        
    }
    
    func eat() {
        score += 1
        size += 1
        
    }
    
}