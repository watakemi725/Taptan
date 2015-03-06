//
//  FInishViewController.swift
//  taptan
//
//  Created by Takemi Watanuki on 2015/03/06.
//  Copyright (c) 2015年 watakemi725. All rights reserved.
//

import UIKit

class FInishViewController : UIViewController {

    @IBOutlet var label : UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate //AppDelegateのインスタンスを取得
        var score = appDelegate.score
        let str = "Time:".stringByAppendingFormat("%.1f",score!)
        label.text = str
        println(str)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func back(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
