//
//  ViewController.swift
//  taptan
//
//  Created by Takemi Watanuki on 2015/02/23.
//  Copyright (c) 2015年 watakemi725. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cnt : Float = 0
    
    @IBOutlet var timerLabel : UILabel!
    @IBOutlet var btn : UIButton!
    
    
    
    //タイマー.
    var timer : NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //タイマーを作る.
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        
        btn = UIButtonAnimated(frame: CGRectMake(0, 0, 300, 300))

        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //ボタンが押された時に呼ばれるメソッド.
    @IBAction func onMyButtonClick(sender : UIButton){
        
        
        //timerが動いてるなら.
        if timer.valid == true {
            
            //timerを破棄する.
            timer.invalidate()
            
            //ボタンのタイトル変更.
            sender.setTitle("Start Timer", forState: UIControlState.Normal)
        }
        else{
            
            //timerを生成する.
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
            
            //ボタンのタイトル変更.
            sender.setTitle("Stop Timer", forState: UIControlState.Normal)
        }
        
    }
    
    
    
    //NSTimerIntervalで指定された秒数毎に呼び出されるメソッド.
    func onUpdate(timer : NSTimer){
        
        cnt += 0.1
        
        //桁数を指定して文字列を作る.
        let str = "Time:".stringByAppendingFormat("%.1f",cnt)
        
        timerLabel.text = str
        
    }
    
}




class UIButtonAnimated: UIButton {
    
    override init() {
        super.init()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        self.touchStartAnimation()
    }
    
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        super.touchesCancelled(touches, withEvent: event)
        self.touchEndAnimation()
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        super.touchesEnded(touches, withEvent: event)
        self.touchEndAnimation()
    }
    
    private func touchStartAnimation(){
        UIView.animateWithDuration(0.1,
            delay: 0.0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: {() -> Void in
                self.transform = CGAffineTransformMakeScale(0.95, 0.95);
                self.alpha = 0.7
            },
            completion: nil
        )
    }
    private func touchEndAnimation(){
        UIView.animateWithDuration(0.1,
            delay: 0.0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: {() -> Void in
                self.transform = CGAffineTransformMakeScale(1.0, 1.0);
                self.alpha = 1
            },
            completion: nil
        )
    }
    
}

