//
//  Apple.swift
//  Snake Game
//
//  Created by Josh Bradley on 1/12/16.
//  Copyright © 2016 Josh Bradley. All rights reserved.
//

import Foundation
import UIKit

class Apple: NSObject {
    var snake: SnakeLocation!
    var board: GameMap!
    var board2: ArcadeGameMap!
    var apples: Array<Point> = []
    
    func resetAllApples(board: GameMap) {
        print("hi")
        board.apples.removeAll()
        var appleX = Int(arc4random_uniform(UInt32(board.sizeX - 2)) + 1)
        var appleY = Int(arc4random_uniform(UInt32(board.sizeY - 2)) + 1)
        
        for (var i = 0; i < NSUserDefaults.standardUserDefaults().integerForKey("appleNum"); i++) {
            appleX = Int(arc4random_uniform(UInt32(board.sizeX - 2)) + 1)
            appleY = Int(arc4random_uniform(UInt32(board.sizeY - 2)) + 1)
            board.apples.append(Point(X:appleX, Y:appleY))
        }
        
        // stuff for overlapping apples
        for var j = 1; j < board.apples.count; j++ {
            for var i = 1; i < board.apples.count; i++ {
                let apple = board.apples[i]
                print("did work")
                if appleX == apple.x && appleY == apple.y {
                    appleX = Int(arc4random_uniform(UInt32(board.sizeX - 2)) + 1)
                    appleY = Int(arc4random_uniform(UInt32(board.sizeY - 2)) + 1)
                    board.apples[j] = Point(X: appleX, Y: appleY)
                    
                    
                }
                
            }
        }
        
    }
    func resetApple(index: Int){
        let test = NSUserDefaults.standardUserDefaults().integerForKey("appleNum")
        var tester = 0
        var appleX = Int(arc4random_uniform(UInt32(board.sizeX - 2)) + 1)
        var appleY = Int(arc4random_uniform(UInt32(board.sizeY - 2)) + 1)
        while tester <= test {
            print("hi")
            for var i = 1; i < apples.count; i++ {
                let apple = apples[i]
                if appleX == apple.x && appleY == apple.y {
                    appleX = Int(arc4random_uniform(UInt32(board.sizeX - 2)) + 1)
                    appleY = Int(arc4random_uniform(UInt32(board.sizeY - 2)) + 1)
                    print("overlap")
                }
                else{
                    tester += 1
                }
            }
        }
        apples[index] = Point(X: appleX, Y: appleY)
    }
    
    
    
}