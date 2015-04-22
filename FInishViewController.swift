//
//  FInishViewController.swift
//  taptan
//
//  Created by Takemi Watanuki on 2015/03/06.
//  Copyright (c) 2015年 watakemi725. All rights reserved.
//

import UIKit

import Social

class FInishViewController : UIViewController,GADBannerViewDelegate {

    @IBOutlet var label : UILabel!
    
    var myComposeView : SLComposeViewController!

    var score : Float!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate //AppDelegateのインスタンスを取得
        score = appDelegate.score
        
        
        
        let str = "".stringByAppendingFormat("%.2f",score!*10)
        
        label.text = str
        label.font = UIFont(name: "MatissePro-EB", size: 70 )
        
        println(str)
        
        // Do any additional setup after loading the view.
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
    
    
    @IBAction func back(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func tweet(){
        
        let layer = UIApplication.sharedApplication().keyWindow?.layer
        
        let scale = UIScreen.mainScreen().scale;
        UIGraphicsBeginImageContextWithOptions(layer!.frame.size, false, scale)
        
        layer!.renderInContext(UIGraphicsGetCurrentContext())
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
//        UIImageWriteToSavedPhotosAlbum(screenshot, nil, nil, nil);
        
        // SLComposeViewControllerのインスタンス化.
        // ServiceTypeをTwitterに指定.
        myComposeView = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        
        var str1 : String = "I have".stringByAppendingFormat("%.2f",score!*10)
        var str2 : String = "秒 我慢ed"
        
        
        // 投稿するテキストを指定.
        myComposeView.setInitialText(str1+str2)
        
        
        // 投稿する画像を指定.
        myComposeView.addImage(screenshot) //(UIImage(named: "oouchi.jpg"))
        
        // myComposeViewの画面遷移.
        self.presentViewController(myComposeView, animated: true, completion: nil)
    
    
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
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
