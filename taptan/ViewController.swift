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
    
    var onoff : Bool = false
    
    @IBOutlet var timerLabel : UILabel!
    @IBOutlet var btn : UIButton!
    
    
    
    
    //タイマー.
    var timer : NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //timerを生成する.
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func theTouchDown( sender : UIButton ){
        onoff = true
    }
    @IBAction func theTouchUpInside( sender : UIButton ){
        onoff = false
    }
    @IBAction func theTouchUpOutside( sender : UIButton ){
        onoff = false
    }
    
    
    //ボタンが押された時に呼ばれるメソッド.
    @IBAction func onMyButtonClick(){
        
        
        //timerが動いてるなら.
        if timer.valid == true {
            
            //timerを破棄する.
            timer.invalidate()
            
            //ボタンのタイトル変更.
        }
        else if timer.valid == false {
            
            //            //timerを生成する.
            //            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
            
            //ボタンのタイトル変更.
        }
        
    }
    
    
    
    //NSTimerIntervalで指定された秒数毎に呼び出されるメソッド.
    func onUpdate(timer : NSTimer){
        
        if onoff == true {
            cnt += 0.1
            
            //桁数を指定して文字列を作る.
            let str = "Time:".stringByAppendingFormat("%.1f",cnt)
            
            timerLabel.text = str
        }else{
            
        }
        
    }
    
}





   