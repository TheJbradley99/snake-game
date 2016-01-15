//
//  SnakeLocation.swift
//  Snake Game
//
//  Copyright © 2015 Josh Bradley. All rights reserved.
//

import Foundation


class SnakeLocation: NSObject {
    // lots of declrations of things

    var tail = [Point(X: 0, Y: 0)]
    var size = 0
    var apples = NSUserDefaults.standardUserDefaults().integerForKey("appleNum")
    var score = 0
    var arcadeScore = 0
    var arcadeHighScore = NSUserDefaults.standardUserDefaults().integerForKey("arcadeHighScore")
    var highScore = NSUserDefaults.standardUserDefaults().integerForKey("highScore")
    var direction: NSString = "start"
    var badApples = 10
    var inWall = 10
    
    
    
    // main reset for the classic game mode
    func reset(board: GameMap) {
        
        // score storage and high score determiner
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

        // Reset apples (really first spawning of apples)
        board.apples.removeAll()
        var appleX = Int(arc4random_uniform(UInt32(board.sizeX - 2)) + 1)
        var appleY = Int(arc4random_uniform(UInt32(board.sizeY - 2)) + 1)
        for (var i = 0; i < apples; i++) {
            appleX = Int(arc4random_uniform(UInt32(board.sizeX - 2)) + 1)
            appleY = Int(arc4random_uniform(UInt32(board.sizeY - 2)) + 1)
            board.apples.append(Point(X:appleX, Y:appleY))
        }
        
        // stuff for overlapping apples
        
        for var j = 1; j < board.apples.count; j++ {
            for var i = 1; i < board.apples.count; i++ {
                let apple = board.apples[i]
                if appleX == apple.x && appleY == apple.y {
                    appleX = Int(arc4random_uniform(UInt32(board.sizeX - 2)) + 1)
                    appleY = Int(arc4random_uniform(UInt32(board.sizeY - 2)) + 1)
                    board.apples[j] = Point(X: appleX, Y: appleY)
                    print("overlap2")
                    
                }
                
            }
        }
            
        
        
 
   }

    // rest the borad for arcade
    func reset2(board: ArcadeGameMap) {
        
        // same thing as in the first reset function 
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
        // reset not so apple apples
        board.badApples.removeAll()
        for (var i = 0; i < badApples; i++) {
            let appleX = Int(arc4random_uniform(UInt32(board.sizeX - 2)) + 1)
            let appleY = Int(arc4random_uniform(UInt32(board.sizeY - 2)) + 1)
            board.badApples.append(Point(X:appleX, Y:appleY))
        }
        // this is really just for spawning in them they (you die when you hit them)
        board.inWall.removeAll()
        for (var i = 0; i < inWall; i++) {
            let appleX = Int(arc4random_uniform(UInt32(board.sizeX - 2)) + 1)
            let appleY = Int(arc4random_uniform(UInt32(board.sizeY - 2)) + 1)
            board.inWall.append(Point(X:appleX, Y:appleY))
        }
        
    }
    // if you are wondering what these functions do READ
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