//
//  ViewController.swift
//  weizhushenjingmao
//
//  Created by Bor on 15/12/26.
//  Copyright © 2015年 bor. All rights reserved.
//

import UIKit

var map = [[0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0]]

var hasCircle = 0

var allCircleLocations = [[CircleLocation]]()

func produceAllCircleLocations(){
    for var i = 0 ; i < 9; i++ {
        var rowCircleLocations = [CircleLocation]()
        for var j = 0;j < 9;j++ {
        let loc = CircleLocation(row: i, col: j)
            rowCircleLocations.append(loc)
        }
        allCircleLocations.append(rowCircleLocations)
    }
}
class ViewController: UIViewController {
    var allButtons = [[UIButton]]()
    var cat = CircleLocation(row: 4, col: 4)
    let catImageview = UIImageView()
    var pathNumber = 0
    var isGameOver = 0
    var clickedPoint : CircleLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let backgroundImageview = UIImageView()
        backgroundImageview.frame = CGRectMake(0, 0, 320, 480)
        backgroundImageview.image = UIImage(named: "background1.png")
        self.view.addSubview(backgroundImageview)
        
        produceAllButtons()
        produceCat()
        produceGameLevel()
        produceAllCircleLocations()
    }
    
    func initilizeGame(){
        for var i = 0;i < 9; i++ {
            for var j = 0; j < 9; j++ {
                allButtons[i][j].setImage(UIImage(named: "gray.png"), forState: UIControlState.Normal)
                map[i][j] = 0;
            }
        }
        map[4][4] = 1
        cat.row = 4
        cat.col = 4
        catImageview.frame = CGRectMake((CGFloat)(28*4+20), (CGFloat)(28*3+170), 30, 56)
        produceGameLevel()
        pathNumber = 0
        isGameOver = 0
    }
    
    func produceGameLevel(){
        let gameLevel = (Int)(arc4random() % 40 + 10)
        var wallNumber = 0
        
        while wallNumber < gameLevel{
            let i = (Int)(arc4random() % 9)
            let j = (Int)(arc4random() % 9)
            if map[i][j] == 0 {
            allButtons[i][j].setImage(UIImage(named: "yellow2.png"),forState: UIControlState.Normal)
            wallNumber++;
                map[i][j] = 1
            }
        }
    }
    
    func produceCat(){
        
        catImageview.frame = CGRectMake((CGFloat)(20+28*4),(CGFloat)(170+28*3), 28, 56)
        let leftImage = UIImage(named: "left2.png")
        let middleImage = UIImage(named: "middle2.png")
        let rightImage = UIImage(named: "right2.png")
        catImageview.animationImages = [leftImage!, middleImage!, rightImage!]
        catImageview.animationDuration = 1.0
        catImageview.startAnimating()
        map[4][4] = 1
        self.view.addSubview(catImageview)
        
    }
    
    func produceAllButtons(){
        for var i = 0; i < 9; i++ {
            var rowButtons = [UIButton]()
            for var j = 0; j < 9; j++ {
                let btn = UIButton()
                rowButtons.append(btn)
                btn.addTarget(self, action: "clickMe:", forControlEvents: UIControlEvents.TouchUpInside)
                if i % 2 == 0 {
                    btn.frame = CGRectMake((CGFloat)(20+28*j),(CGFloat)(170+28*i), 28, 28)
                }
                else {
                    btn.frame = CGRectMake((CGFloat)(34+28*j),(CGFloat)(170+28*i), 28, 28)
                }
                self.view.addSubview(btn)
                btn.setImage(UIImage(named: "gray.png"), forState: UIControlState.Normal)
            }
            allButtons.append(rowButtons)
        }
    }
    //设计9*9的界面
    func getButtonRow(btn:UIButton) -> Int {
        let y = (Int)(btn.frame.origin.y)
        let row = (y - 170) / 28
        return row
    }
    
    func getButtonCol(btn:UIButton) -> Int {
        let x = (Int)(btn.frame.origin.x)
        let y = (Int)(btn.frame.origin.y)
        let row = (y - 170) / 28
        
        var col = 0
        if (row % 2 == 0) {
            col = (x - 20) / 28
        }
        else {
            col = (x - 34) / 28
        }
        return col
    }
    
    func clickMe(btn: UIButton){
        btn.setImage(UIImage(named: "yellow2.png"), forState: UIControlState.Normal)
        let row = getButtonRow(btn)
        let col = getButtonCol(btn)
        clickedPoint = allCircleLocations[row][col]
        updateCost(row, col:col)
        pathNumber++
        
        if isGameOver == 1 && row == cat.row && col == cat.col{
            showWinAlertView()
            return
        }
        else if isGameOver == 1{
            //什么都不做
        }
        else{
            isGameOver = catAutoGo()
            if isGameOver == -1 {
                showLoseAlertView()
                return
            }
            if isGameOver == 1 && row == cat.row && col == cat.col{
                showWinAlertView()
                return
            }
        }

    }
    
    func runAgain(){
        initilizeGame()
    }
    
    func showLoseAlertView() {
        let alert = UIAlertController(title: "亲，猫跑掉了！", message: "你失败了！加油啊！", preferredStyle: .Alert)
        let actionYes = UIAlertAction(title: "退出游戏？", style: .Default, handler: {act in exit(-1)})
        let actionNo = UIAlertAction(title: "再来一次？", style: .Default, handler: {act in self.runAgain()})
        alert.addAction(actionYes)
        alert.addAction(actionNo)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showWinAlertView() {
        let alert = UIAlertController(title: "亲，你的步数是：\(pathNumber)次", message: "你成功抓住猫了！", preferredStyle: .Alert)
        let actionYes = UIAlertAction(title: "退出游戏？", style: .Default, handler: {act in exit(-1)})
        let actionNo = UIAlertAction(title: "再来一次？", style: .Default, handler: {act in self.runAgain()})
        alert.addAction(actionYes)
        alert.addAction(actionNo)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func updateCost(row:Int, col: Int){
        map[row][col] = 1
        calAllCost()
        
    }

    func getBestLocation() -> CircleLocation?{
        let catAllConnects = cat.getAllConnectLocation()
        if catAllConnects.count > 0 {
            var best = catAllConnects[0]
            if best.isBoundary(){
                return best
            }
            for var i = 0; i < catAllConnects.count; i++ {
                if catAllConnects[i].isBoundary(){
                    best = catAllConnects[i]
                    break
                }
                if best.compare(catAllConnects[i]){
                    best = catAllConnects[i]
                }
            }
            return best
        }
        else{
            return nil
        }
    }
    
    func catAutoGo()->Int{
        let temp = getBestLocation()
        if let best = temp {
            if clickedPoint?.row == cat.row && clickedPoint?.col == cat.col{
                //什么都不做
            }
            else{
               map[cat.row][cat.col] = 0
            }
            
            cat.col = best.col
            cat.row = best.row
            let i = best.row
            let j = best.col
            map[i][j] = 1
            if i % 2 == 0 {
                catImageview.frame = CGRectMake((CGFloat)(28*j+20), (CGFloat)(28*(i-1)+170), 30, 56)
            }
            else{
                catImageview.frame = CGRectMake((CGFloat)(28*j+34), (CGFloat)(28*(i-1)+170), 30, 56)
            }
            if best.isBoundary(){
                return -1
            }
        }
        else{
            return 1  //周围没有逃跑的点
        }
        return 0
    }
    func calAllCost(){
        clearAllCost()
        for var i = 0; i < 9; i++ {
            for var j = 0; j < 9; j++ {
                allCircleLocations[i][j].calculateCost()
            }
        }
        
        //左上角
        for var i = 0; i < 9; i++ {
            for var j = 0; j < 9; j++ {
                allCircleLocations[i][j].calculatePath()
                allCircleLocations[j][i].calculatePath()
            }
        }
        
        //右上角
        for var i = 0; i < 9; i++ {
            for var j = 0; j < 9; j++ {
                allCircleLocations[i][8-j].calculatePath()
                allCircleLocations[j][8-i].calculatePath()
            }
        }
        
        //左下角
        for var i = 0; i < 9; i++ {
            for var j = 0; j < 9; j++ {
                allCircleLocations[8-i][j].calculatePath()
                allCircleLocations[8-j][i].calculatePath()
            }
        }
        
        //右下角
        for var i = 0; i < 9; i++ {
            for var j = 0; j < 9; j++ {
                allCircleLocations[8-i][8-j].calculatePath()
                allCircleLocations[8-j][8-i].calculatePath()
            }
        }
        
        hasCircle = cat.isInCircle()
    }
    func clearAllCost(){
        for var i = 0; i < 9; i++ {
            for var j = 0; j < 9; j++ {
                allCircleLocations[i][j].cost = -100
                allCircleLocations[i][j].path = -100
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

