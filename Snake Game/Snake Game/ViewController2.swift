//
//  ViewController.swift
//  Snake Game
//
//  Copyright © 2015 Josh Bradley. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITextFieldDelegate {
    
    
    var board: GameMap!
    var timer: NSTimer!
    var snake: SnakeLocation!
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    @IBOutlet weak var arcadeScoreDisplay: UILabel!
    @IBOutlet weak var lostLabel: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var arcadeHighScoreDisplay: UILabel!
    @IBOutlet weak var pauseButton1: UIBarButtonItem!
    @IBOutlet weak var resume: UIButton!
    @IBOutlet weak var options: UIButton!
    @IBOutlet weak var menu: UIButton!
    @IBOutlet weak var darkView: UIView!
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var playAgainMenu: UIButton!
    
    var pause = false
    @IBAction func pauseButton(sender: AnyObject) {
        if !pause {
            timer.invalidate()
            pause = true
            
            
            UIView.animateWithDuration(0.5, animations: {
                self.darkView.alpha = 1.0
                self.resume.alpha = 1.0
                self.options.alpha = 1.0
                self.menu.alpha = 1.0
                
            })
        }else {
            print("ahhhhh")
        }
        
    }
    var seconds = 3
    @IBAction func resumeButton(sender: AnyObject) {
        
        
        UIView.animateWithDuration(0.5, animations: {
            self.darkView.alpha = 0
            self.resume.alpha = 0
            self.options.alpha = 0
            self.menu.alpha = 0
            self.countDownLabel.alpha = 1
        })
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "subtractTime", userInfo: nil, repeats: true)
    }
    
    func subtractTime() {
        
        seconds--
        countDownLabel.text = "\(seconds)"
        
        if seconds == 0 {
            timer.invalidate()
            self.countDownLabel.alpha = 0
            seconds = 3
            countDownLabel.text = "\(seconds)"
            pause = false
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "update", userInfo: nil, repeats: true)
            
        }
    }
    
    @IBAction func PlayAgain(sender: AnyObject) {
        snake.direction = "start"
        
        arcadeScoreDisplay.text = "0"
        //board.resetApple()
        
        
        lostLabel.hidden = true
        playAgain.hidden = true
        playAgainMenu.hidden = true
        
        lostLabel.center = CGPointMake(lostLabel.center.x - 400, lostLabel.center.y)
        playAgain.center = CGPointMake(playAgain.center.x - 400, playAgain.center.y)
        playAgainMenu.center = CGPointMake(playAgain.center.x - 400, playAgainMenu.center.y)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "update", userInfo: nil, repeats: true)
    }
    // swipe readers
    @IBAction func swipeRight(sender: AnyObject) {
        if snake.direction != "left" {
            snake.direction = "right"
        }
    }
    @IBAction func swipeLeft(sender: AnyObject) {
        if snake.direction != "right" {
            snake.direction = "left"
        }
    }
    @IBAction func swipeUp(sender: AnyObject) {
        if snake.direction != "down" {
            snake.direction = "up"
        }
    }
    @IBAction func swipeDown(sender: AnyObject) {
        if snake.direction != "up" {
            snake.direction = "down"
        }
    }
    // for buttons
    
    
    @IBOutlet weak var arcadeCanvas: CanvasView!
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        board = GameMap()
        board.makeBoard()
        
        snake = SnakeLocation()
        snake.reset(board)
        
        
        prefersStatusBarHidden()
        arcadeCanvas.map = board
        arcadeCanvas.snake = snake
        
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "update", userInfo: nil, repeats: true)
        //hide end label
        lostLabel.hidden = true
        playAgain.hidden = true
        playAgainMenu.hidden = true
        arcadeHighScoreDisplay.text = "\(snake.highScore)"
        
        self.darkView.alpha = 0
        self.resume.alpha = 0
        self.options.alpha = 0
        self.menu.alpha = 0
        self.countDownLabel.alpha = 0
        
        
        
    }
    
    func update() {
        if snake.direction == "start" {
            return
        }
        
        var head = snake.tail[0]
        // collition detector
        if (head.x >= board.sizeX - 1) {
            snake.direction = "stop"
        }else if (head.x <= 0){
            snake.direction = "stop"
        }else if (head.y >= board.sizeY - 1) {
            snake.direction = "stop"
        }else if (head.y <= 0){
            snake.direction = "stop"
        }
        
        // Move our snake
        let newhead = Point(X:head.x, Y:head.y)
        if (snake.direction == "left") {
            newhead.x -= 1
        }else if (snake.direction == "right") {
            newhead.x += 1
        }else if ( snake.direction == "down") {
            newhead.y += 1
        }else if ( snake.direction == "up"){
            newhead.y -= 1
        }
        
        // Add the new head to the FRONT of the tail
        snake.tail = [newhead] + snake.tail
        // CUT the tail by the size
        if snake.tail.count > snake.size {
            snake.tail = Array(snake.tail[0...snake.size])
        }
        
        // Check if we crashed into ourself
        for var i = 1; i < snake.tail.count; i++ {
            let t = snake.tail[i]
            if snake.tail[0].x == t.x && snake.tail[0].y == t.y {
                snake.direction = "stop";
            }
        }
        
        // stop game and display end label
        head = newhead
        if (snake.direction == "stop"){
            snake.reset(board)
            timer.invalidate()
            arcadeHighScoreDisplay.text = "\(snake.highScore)"
            
            
            lostLabel.hidden = false
            playAgain.hidden = false
            playAgainMenu.hidden = false
            
            self.playAgain.center.x = -200
            self.lostLabel.center.x = -200
            self.playAgainMenu.center.x = -200
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                
                self.playAgain.center = CGPointMake(self.screenSize.width / 2, self.playAgain.center.y)
                self.lostLabel.center = CGPointMake(self.screenSize.width / 2, self.lostLabel.center.y)
                self.playAgainMenu.center = CGPointMake(self.screenSize.width / 2, self.playAgainMenu.center.y)
            })
            
            // spawn in snake
        }else if (snake.direction == "start"){
            snake.tail = [Point(X:12, Y:11)]
        }
        
        // eat apples
        for (var i = 0; i < board.apples.count; i++) {
            let apple = board.apples[i]
            if (head.x == apple.x && head.y == apple.y) {
                snake.tail.append(Point(X: apple.x, Y: apple.y))
                snake.eat()
                board.resetApple(i)
                print(snake.score)
                
                arcadeScoreDisplay.text = "\(snake.score)"
            }
        }
        
        //update board
        arcadeCanvas.setNeedsDisplay()
        
    }
    
    
    
}

