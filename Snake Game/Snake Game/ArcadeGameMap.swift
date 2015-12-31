//
//  GameMap.swift
//  Snake Game
//
//  Copyright © 2015 Josh Bradley. All rights reserved.
//

import Foundation
import UIKit


class ArcadeGameMap: NSObject {
    var apples: Array<Point> = []
    var badApples: Array<Point> = []
    
    var sizeY = Int(ViewController().screenSize.height - 44) / tileW
    var sizeX = Int(ViewController().screenSize.width) / tileH
    
    var yoffset = Int(((Double(ViewController().screenSize.height) - 44.0) % tileW1) / 2.0)
    var xoffset = Int(((Double(ViewController().screenSize.width)) % tileH1) / 2.0)
    
    func resetApple(index: Int){
        let appleX = Int(arc4random_uniform(UInt32(sizeX - 2)) + 1)
        let appleY = Int(arc4random_uniform(UInt32(sizeY - 2)) + 1)
        apples[index] = Point(X: appleX, Y: appleY)
    }
    func resetBadApple(index: Int){
        let appleX = Int(arc4random_uniform(UInt32(sizeX - 2)) + 1)
        let appleY = Int(arc4random_uniform(UInt32(sizeY - 2)) + 1)
        badApples[index] = Point(X: appleX, Y: appleY)
    }
    
    var arcadeGame = Array<Array<Int>>()
    
    func arcadeMakeBoard() {
        
        arcadeGame = Array<Array<Int>>()
        for var x = 0; x < sizeY; x++ {
            var temp = Array<Int>()
            for var y = 0; y < sizeX; y++ {
                if x == 0 || y == 0 || x == Int(sizeY) - 1 || y == Int(sizeX) - 1 {
                    temp.append(1)
                }else {
                    temp.append(0)
                }
            }
            arcadeGame.append(temp)
        }
    }
}