//
//  ViewController.swift
//  taptan
//
//  Created by Takemi Watanuki on 2015/02/23.
//  Copyright (c) 2015年 watakemi725. All rights reserved.
//

import UIKit



class ViewController: UIViewController ,GADBannerViewDelegate{
    
    override func viewDidAppear(animated: Bool) {
        cnt = 0
        timerLabel.text = "PUSH"
    }
    
    var cnt : Float = 0
    
    var countNum : Int = 0
    
    var onoff : Bool = false
    
    //フォントを FOT-MatissePro-EB.otf
    
    
    var colorArray = [UIColor]()
    
    
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
        
        
        
        
        timerLabel.font = UIFont(name: "MatissePro-EB", size: 80)
        //フォント名は Postscript名じゃないといけないみたい！！
        

        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        var colorArray = [CGFloat]()
        
        for var i = 0; i <= 5; i++ {
            colorArray.append(CGFloat(Float(arc4random() % 100 + 1)/100.0))
            println(CGFloat(Float(arc4random() % 100 + 1)/100.0))
        }
        
        
        
        //色配列を作成
        
        
        //グラデーションの開始色
        let topColor = UIColor(red:colorArray[0], green:colorArray[1], blue:colorArray[2], alpha:1)
        //グラデーションの開始色
        let bottomColor = UIColor(red:colorArray[3], green:colorArray[4], blue:colorArray[5], alpha:1)
        
        //グラデーションの色を配列で管理
        let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        
        //グラデーションレイヤーを作成
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        //グラデーションの色をレイヤーに割り当てる
        gradientLayer.colors = gradientColors
        //グラデーションレイヤーをスクリーンサイズにする
        gradientLayer.frame = self.view.bounds
        
        //グラデーションレイヤーをビューの一番下に配置
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
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
        //        request.testDevices = ["ac83f39cfb8fa51eff147abbfee9d361"]
        request.testDevices = ["GAD_SIMULATOR_ID"]
        bannerView.loadRequest(request)
        
        return bannerView
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func theTouchDown( sender : UIButton ){
        onoff = true
        
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
        
        /*
        //アニメーション
        UIView.animateWithDuration(
        0.5,
        delay:0.3,
        options:UIViewAnimationOptions.CurveEaseOut,
        animations: {() -> Void in
        //                self.view.center = CGPoint(x:self.view.bounds.width, y:self.view.bounds.height - self.view.bounds.height/2)
        
        
        
        },
        completion: nil
        );
        
        */
        self.burun()
        
    }
    
    func update() {
        countNum++
        
    }
    
    func burun(){
//        UIView.animateWithDuration(0.5,
//            
//            // アニメーション中の処理.
//            animations: { () -> Void in
//                
//                // 縮小用アフィン行列を作成する.
//                self.btn.transform = CGAffineTransformMakeScale(0.9, 0.9)
//                
//            })
//            { (Bool) -> Void in
//                
//                UIView.animateWithDuration(0.5,
//                    
//                    // アニメーション中の処理.
//                    animations: { () -> Void in
//                        
//                        // 拡大用アフィン行列を作成する.
//                        self.btn.transform = CGAffineTransformMakeScale(0.4, 0.4)
//                        
//                        // 縮小用アフィン行列を作成する.
//                        self.btn.transform = CGAffineTransformMakeScale(1.0, 1.0)
//                        
//                    })
//                    { (Bool) -> Void in
//                        self.burun()
//                }
//                
//        }
//        
//        
       
        
        let singleTwist = M_PI * 2
        let horizontalTwistAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        horizontalTwistAnimation.toValue = singleTwist // 1回転
        horizontalTwistAnimation.duration = 0.5
        horizontalTwistAnimation.repeatCount = MAXFLOAT
        
     self.btn.layer.addAnimation(horizontalTwistAnimation, forKey: "kaiten")
        
        
//        // 初期化.
////        self.btn.transform = CGAffineTransformMakeRotation(0)
//        
//        // radianで回転角度を指定(90度).
//        let angle:CGFloat = CGFloat(M_PI_4)
//        
//        // アニメーションの秒数を設定(3秒).
//        UIView.animateWithDuration(3.0,
//            
//            animations: { () -> Void in
//                
//                // 回転用のアフィン行列を生成.
//                self.btn.transform = CGAffineTransformMakeRotation(angle)
//            },
//            completion: { (Bool) -> Void in
//                self.burun()
//        })
        
        
        
    }
    
    
    
    @IBAction func theTouchUpInside( sender : UIButton ){
        onoff = false
        
        appDelegate.score = cnt //appDelegateの変数を操作
        
        var targetView: AnyObject = self.storyboard!.instantiateViewControllerWithIdentifier( "finish" )
        
        self.presentViewController( targetView as UIViewController, animated: true
            , completion: nil)
        
        
        var layerbtn: CALayer = self.btn.layer;
        layerbtn.removeAllAnimations()
        
        
        
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
            cnt += 0.0001
            
            //桁数を指定して文字列を作る.
            let str = "".stringByAppendingFormat("%.2f",cnt*10)
            
            
            timerLabel.text = str
            
            var i:Int=0
            
            
            
            
        }else{
            
        }
        
    }
    
    
    //指定された位置に対してランダムな色を与えるようにする
    
    
    
    
    
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





   