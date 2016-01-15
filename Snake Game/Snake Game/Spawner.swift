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
var apples2: Array<Point> = []

class Spawner: NSObject {
    var board: GameMap!
    var board2: ArcadeGameMap!
    var snake: SnakeLocation!
    
    func initialize() {
        snake = SnakeLocation()
    }
    // 1 == apple, 2 == bad apple, 3 == wall. 1 == classic, 2 == arcade
    func spawn(amount: Int, what: Int, whatFor: Int){
        initialize()
        var AorC = apples
        for var i = 0; i < amount; i++ {
            if whatFor == 2 {
                AorC = apples2
            }
            if what == 1 {
                AorC.removeAll()
                var appleX = 0
                var appleY = 0
                for (var i = 0; i < snake.applesNum; i++) {
                    appleX = Int(arc4random_uniform(UInt32(sizeX - 2)) + 1)
                    appleY = Int(arc4random_uniform(UInt32(sizeY - 2)) + 1)
                    AorC.append(Point(X:appleX, Y:appleY))
                }
                for var j = 1; j < AorC.count; j++ {
                    for var i = 1; i < AorC.count; i++ {
                        if appleX == AorC[i].x && appleY == AorC[i].y {
                            appleX = Int(arc4random_uniform(UInt32(sizeX - 2)) + 1)
                            appleY = Int(arc4random_uniform(UInt32(sizeY - 2)) + 1)
                            AorC[j] = Point(X: appleX, Y: appleY)
                        }
                        
                    }
                }
                if whatFor == 1 {
                    apples = AorC
                }
                if whatFor == 2 {
                    apples2 = AorC
                }
            }
        }
    }
    
    
    func respawn(index: Int, what: Int, whatFor: Int) {
        var AorC = apples
        if whatFor == 2 {
            AorC = apples2
        }
        if what == 1 {
            var X = Int(arc4random_uniform(UInt32(sizeX - 2)) + 1)
            var Y = Int(arc4random_uniform(UInt32(sizeY - 2)) + 1)
            for var a = 0; a < apples.count; a++ {
                if AorC[a].x == X && AorC[a].y == Y{
                    print("hi")
                    X = Int(arc4random_uniform(UInt32(sizeX - 2)) + 1)
                    Y = Int(arc4random_uniform(UInt32(sizeY - 2)) + 1)
                }
            }
            AorC[index] = Point(X: X, Y: Y)
            if whatFor == 1 {
                apples = AorC
            }
            if whatFor == 2 {
                apples2 = AorC
            }
        }
        
    }
    
}