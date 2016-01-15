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

var sizeY = Int(ViewController().screenSize.height - 44) / tileW
var sizeX = Int(ViewController().screenSize.width) / tileH

class GameMap: NSObject {
    var snake: SnakeLocation!
    var spawn: Spawner!
    
    
    
    var yoffset = Int(((Double(ViewController().screenSize.height) - 44.0) % tileW1) / 2.0)
    var xoffset = Int(((Double(ViewController().screenSize.width)) % tileH1) / 2.0)
    
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