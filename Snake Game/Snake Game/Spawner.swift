//
//  Spawner.swift
//  Snake Game
//
//  Created by Josh Bradley on 1/14/16.
//  Copyright © 2016 Josh Bradley. All rights reserved.
//

import Foundation
import UIKit

var apples: Array<Point> = []

class Spawner: NSObject {
    var board: GameMap!
    var board2: ArcadeGameMap!
    var snake: SnakeLocation!
    
    func initialize() {
        snake = SnakeLocation()
    }
    // 1 == apple, 2 == bad apple, 3 == wall.
    func spawn(amount: Int, what: Int){
        initialize()
        for var i = 0; i < amount; i++ {
            if what == 1 {
                apples.removeAll()
                var appleX = 0
                var appleY = 0
                for (var i = 0; i < snake.applesNum; i++) {
                    appleX = Int(arc4random_uniform(UInt32(sizeX - 2)) + 1)
                    appleY = Int(arc4random_uniform(UInt32(sizeY - 2)) + 1)
                    apples.append(Point(X:appleX, Y:appleY))
                }
                for var j = 1; j < apples.count; j++ {
                    for var i = 1; i < apples.count; i++ {
                        if appleX == apples[i].x && appleY == apples[i].y {
                            appleX = Int(arc4random_uniform(UInt32(sizeX - 2)) + 1)
                            appleY = Int(arc4random_uniform(UInt32(sizeY - 2)) + 1)
                            apples[j] = Point(X: appleX, Y: appleY)
                        }
                        
                    }
                }
            }
        }
    }
    func respawn(index: Int, what: Int) {
        if what == 1 {
            var X = Int(arc4random_uniform(UInt32(sizeX - 2)) + 1)
            var Y = Int(arc4random_uniform(UInt32(sizeY - 2)) + 1)
            for var a = 0; a < apples.count; a++ {
                if apples[a].x == X && apples[a].y == Y{
                    print("hi")
                    X = Int(arc4random_uniform(UInt32(sizeX - 2)) + 1)
                    Y = Int(arc4random_uniform(UInt32(sizeY - 2)) + 1)
                }
            }
            apples[index] = Point(X: X, Y: Y)
        }
        
    }
    
}