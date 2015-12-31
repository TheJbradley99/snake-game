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
    var apples = NSUserDefaults.standardUserDefaults().integerForKey("appleNum")
    var score = 0
    var arcadeScore = 0
    var arcadeHighScore = NSUserDefaults.standardUserDefaults().integerForKey("arcadeHighScore")
    var highScore = NSUserDefaults.standardUserDefaults().integerForKey("highScore")
    var direction: NSString = "start"
    var badApples = 10
    func reset(board: GameMap) {
        
        
        NSUserDefaults.standardUserDefaults().integerForKey("highScore")
        NSUserDefaults.standardUserDefaults().integerForKey("arcadeHighScore")
        if score > NSUserDefaults.standardUserDefaults().integerForKey("highScore") {
            NSUserDefaults.standardUserDefaults().setInteger(score, forKey: "highScore")
            NSUserDefaults.standardUserDefaults().synchronize()
            
        }
        if arcadeScore > NSUserDefaults.standardUserDefaults().integerForKey("arcadeHighScore") {
            NSUserDefaults.standardUserDefaults().setInteger(arcadeScore, forKey: "arcadeHighScore")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        arcadeHighScore = NSUserDefaults.standardUserDefaults().integerForKey("arcadeHighScore")
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
    func reset2(board: ArcadeGameMap) {
        
        
        NSUserDefaults.standardUserDefaults().integerForKey("highScore")
        NSUserDefaults.standardUserDefaults().integerForKey("arcadeHighScore")
        if score > NSUserDefaults.standardUserDefaults().integerForKey("highScore") {
            NSUserDefaults.standardUserDefaults().setInteger(score, forKey: "highScore")
            NSUserDefaults.standardUserDefaults().synchronize()
            
        }
        if arcadeScore > NSUserDefaults.standardUserDefaults().integerForKey("arcadeHighScore") {
            NSUserDefaults.standardUserDefaults().setInteger(arcadeScore, forKey: "arcadeHighScore")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        arcadeHighScore = NSUserDefaults.standardUserDefaults().integerForKey("arcadeHighScore")
        highScore = NSUserDefaults.standardUserDefaults().integerForKey("highScore")
        
        
        score = 0
        size = 0
        tail = [Point(X:board.sizeX / 2, Y:board.sizeY / 2)]
        arcadeScore = 0
        // Reset apples
        board.apples.removeAll()
        for (var i = 0; i < apples; i++) {
            let appleX = Int(arc4random_uniform(UInt32(board.sizeX - 2)) + 1)
            let appleY = Int(arc4random_uniform(UInt32(board.sizeY - 2)) + 1)
            board.apples.append(Point(X:appleX, Y:appleY))
        }
        board.badApples.removeAll()
        for (var i = 0; i < badApples; i++) {
            let appleX = Int(arc4random_uniform(UInt32(board.sizeX - 2)) + 1)
            let appleY = Int(arc4random_uniform(UInt32(board.sizeY - 2)) + 1)
            board.badApples.append(Point(X:appleX, Y:appleY))
        }
        
    }
    
    func eat() {
        score += 1
        size += 1
        
    }
    func arcadeEat() {
        size += 1
        arcadeScore += 1
    }
    func badEat(){
        size -= 1
        arcadeScore -= 1
        if size < 0 {
            direction = "stop"
        }
    }
    
}