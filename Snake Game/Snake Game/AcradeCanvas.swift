//
//  AcradeCanvas.swift
//  Snake Game
//
//  Created by Josh on 11/30/15.
//  Copyright © 2015 Josh Bradley. All rights reserved.
//


import Foundation
import UIKit

class AcradeCanvasView: UIView {
    var map: ArcadeGameMap!
    var snake: SnakeLocation!
    
    override func drawRect(rect: CGRect) {
        // Set up for later
        let context = UIGraphicsGetCurrentContext()
        
        for var y = 0; y < map.arcadeGame.count; y++ {
            for var x = 0; x < map.arcadeGame[0].count; x++ {
                let tile = map.arcadeGame[y][x]
                
                // Draw the inside
                
                if (tile == 0) {
                    CGContextBeginPath(context);
                    CGContextMoveToPoint(context, CGFloat((x * tileW) + map.xoffset ), CGFloat(y * tileH + map.yoffset))
                    CGContextAddLineToPoint(context, CGFloat(((x+1) * tileW) + map.xoffset), CGFloat(y * tileH + map.yoffset))
                    CGContextAddLineToPoint(context, CGFloat(((x+1) * tileW) + map.xoffset), CGFloat((y+1) * tileH + map.yoffset))
                    CGContextAddLineToPoint(context, CGFloat((x * tileW) + map.xoffset), CGFloat((y+1) * tileH + map.yoffset))
                    CGContextClosePath(context)
                    // makes the lines for the grid (well colors them at least)
                    //CGContextSetRGBStrokeColor(context, 0.7, 0.7, 0.7, 1.0)
                    //CGContextSetLineWidth(context, 1.0)
                    //CGContextStrokePath(context)
                    
                    CGContextSetRGBFillColor(context, 0.9, 0.9, 0.9, 1.0)
                } else if (tile == 1) {
                    CGContextSetRGBFillColor(context, 62/255, 129/255, 1.0, 1.0)
                }
                CGContextFillRect(context, CGRectMake(
                    CGFloat((x * tileW) + map.xoffset), CGFloat(y * tileH + map.yoffset),
                    CGFloat(tileW), CGFloat(tileH))
                )
            }
        }
        
        // Now draw the snake in the right spot
        // for point in snake.tail: render
        for var point in snake.tail {
            CGContextSetRGBFillColor(context, 0.0, 0.9, 0.0, 1.0)
            CGContextFillRect(context, CGRectMake(
                CGFloat(point.x * tileW + map.xoffset), CGFloat(point.y * tileH + map.yoffset),
                CGFloat(tileW), CGFloat(tileH))
            )
        }
        
        // Now draw the apples
        for var apple in map.apples {
            CGContextSetRGBFillColor(context, 0.9, 0.0, 0.0, 1.0)
            CGContextFillRect(context, CGRectMake(
                CGFloat(apple.x * tileW + map.xoffset), CGFloat(apple.y * tileH + map.yoffset),
                CGFloat(tileW), CGFloat(tileH))
            )
        }
        //draw the bad apples
        for var badApple in map.badApples {
            CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0)
            CGContextFillRect(context, CGRectMake(
                CGFloat(badApple.x * tileW + map.xoffset), CGFloat(badApple.y * tileH + map.yoffset),
                CGFloat(tileW), CGFloat(tileH))
            )
        }
        
        //in game room walls
        for var inWall in map.inWall {
            CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0)
            CGContextFillRect(context, CGRectMake(
                CGFloat(inWall.x * tileW + map.xoffset), CGFloat(inWall.y * tileH + map.yoffset),
                CGFloat(tileW), CGFloat(tileH))
            )
        }
        // my brefe pic fase 
        func drawRect(rect: CGRect)
        {
            let myImage = UIImage(named: "apple.png")
            let imagePoint = CGPointMake(0, 0)
            myImage?.drawAtPoint(imagePoint)
        }
        
        
    }
}