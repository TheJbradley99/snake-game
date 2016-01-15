//
//  GameMap.swift
//  Snake Game
//
//  Copyright © 2015 Josh Bradley. All rights reserved.
//

import Foundation
import UIKit

var tileW1 = 16.0
var tileH1 = 16.0
var tileW = 16
var tileH = 16

class GameMap: NSObject {
    var snake: SnakeLocation!
    var apples: Array<Point> = []
    
    var sizeY = Int(ViewController().screenSize.height - 44) / tileW
    var sizeX = Int(ViewController().screenSize.width) / tileH
    
    var yoffset = Int(((Double(ViewController().screenSize.height) - 44.0) % tileW1) / 2.0)
    var xoffset = Int(((Double(ViewController().screenSize.width)) % tileH1) / 2.0)
    

    func resetApple(index: Int){
        let test = NSUserDefaults.standardUserDefaults().integerForKey("appleNum")
        var tester = 0
        var appleX = Int(arc4random_uniform(UInt32(sizeX - 2)) + 1)
        var appleY = Int(arc4random_uniform(UInt32(sizeY - 2)) + 1)
        if NSUserDefaults.standardUserDefaults().integerForKey("appleNum") > 1 {
            while tester <= test {
                for var i = 1; i < apples.count; i++ {
                    let apple = apples[i]
                    if appleX == apple.x && appleY == apple.y {
                        appleX = Int(arc4random_uniform(UInt32(sizeX - 2)) + 1)
                        appleY = Int(arc4random_uniform(UInt32(sizeY - 2)) + 1)
                        print("overlap1")
                    }
                    else{
                       tester += 1
                    }
                }
            }
        }
        apples[index] = Point(X: appleX, Y: appleY)
    }
    
    var game = Array<Array<Int>>()
    
    func makeBoard() {
        
        game = Array<Array<Int>>()
        for var x = 0; x < sizeY; x++ {
            var temp = Array<Int>()
            for var y = 0; y < sizeX; y++ {
                if x == 0 || y == 0 || x == Int(sizeY) - 1 || y == Int(sizeX) - 1 {
                    temp.append(1)
                }else {
                    temp.append(0)
                }
            }
            game.append(temp)
        }
    }
}