//
//  ViewController.swift
//  taptan
//
//  Created by Takemi Watanuki on 2015/02/23.
//  Copyright (c) 2015年 watakemi725. All rights reserved.
//

import UIKit


class ViewController: UIViewController ,GADBannerViewDelegate{
    
    var cnt : Float = 0
    
    var onoff : Bool = false
    
    @IBOutlet var timerLabel : UILabel!
    @IBOutlet var btn : UIButton!
    
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate //AppDelegateのインスタンスを取得
   
    
    
    //タイマー.
    var timer : NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //timerを生成する.
        timer = NSTimer.scheduledTimerWithTimeInterval(0.000001, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
//        btn.addTarget(self, action: "wasDragged: event:", forControlEvents: UIControlEvents.TouchDragInside)
     
        
        
        //admob関係
        let bannerView:GADBannerView = getAdBannerView()
        self.view.addSubview(bannerView)
        
        

        
    
        
    }
    
    
    //admob関係
    private func getAdBannerView() -> GADBannerView {
        var bannerView: GADBannerView = GADBannerView()
        bannerView = GADBannerView(adSize:kGADAdSizeBanner)
        bannerView.frame.origin = CGPointMake(0, self.view.frame.size.height - bannerView.frame.height)
        bannerView.frame.size = CGSizeMake(self.view.frame.width, bannerView.frame.height)
        bannerView.adUnitID = "ca-app-pub-1674810718316989/2473845752" // Enter Ad's ID here
        bannerView.delegate = self
        bannerView.rootViewController = self
        
        var request:GADRequest = GADRequest()
        request.testDevices = ["ac83f39cfb8fa51eff147abbfee9d361"]
        bannerView.loadRequest(request)
        
        return bannerView
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
        
         appDelegate.score = cnt //appDelegateの変数を操作
        
        var targetView: AnyObject = self.storyboard!.instantiateViewControllerWithIdentifier( "finish" )
        
        self.presentViewController( targetView as UIViewController, animated: true
, completion: nil)
    }
    @IBAction func theTouchUpOutside( sender : UIButton ){
        onoff = false

    
    }
    
    

    
    
    func wasDragged (buttn : UIButton, event :UIEvent)
    {
//        var touch : UITouch = event.touchesForView(buttn) .anyobject() as UITouch
//        var previousLocation : CGPoint = touch .previousLocationInView(buttn)
//        var location : CGPoint = touch .locationInView(buttn)
//        var delta_x :CGFloat = location.x - previousLocation.x
//        var delta_y :CGFloat = location.y - previousLocation.y
//        buttn.center = CGPointMake(buttn.center.x + delta_x,
//            buttn.center.y + delta_y);
    }
    
    
    
    //NSTimerIntervalで指定された秒数毎に呼び出されるメソッド.
    func onUpdate(timer : NSTimer){
        
        if onoff == true {
            cnt += 0.001
            
            //桁数を指定して文字列を作る.
            let str = "Time:".stringByAppendingFormat("%.2f",cnt*10)
            
            timerLabel.text = str
        }else{
            
        }
        
    }
    
    
    
    
    
    
    //admob
    func adViewDidReceiveAd(adView: GADBannerView){
        println("adViewDidReceiveAd:\(adView)")
    }
    func adView(adView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError){
        println("error:\(error)")
    }
    func adViewWillPresentScreen(adView: GADBannerView){
        println("adViewWillPresentScreen")
    }
    func adViewWillDismissScreen(adView: GADBannerView){
        println("adViewWillDismissScreen")
    }
    func adViewDidDismissScreen(adView: GADBannerView){
        println("adViewDidDismissScreen")
    }
    func adViewWillLeaveApplication(adView: GADBannerView){
        println("adViewWillLeaveApplication")
    }
    
    
}





   