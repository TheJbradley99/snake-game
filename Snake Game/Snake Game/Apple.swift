//
//  Apple.swift
//  Snake Game
//
//  Created by Josh Bradley on 1/12/16.
//  Copyright © 2016 Josh Bradley. All rights reserved.
//

import Foundation

class Apple: NSObject {
    var snake: SnakeLocation!
    var board: GameMap!
    var board2: ArcadeGameMap!
    
    func resetAllApples() {
        board.apples.removeAll()
        var appleX = Int(arc4random_uniform(UInt32(board.sizeX - 2)) + 1)
        var appleY = Int(arc4random_uniform(UInt32(board.sizeY - 2)) + 1)
        for (var i = 0; i < snake.apples; i++) {
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
                    
                    
                }
                
            }
        }
        
    }
    
    
    
}