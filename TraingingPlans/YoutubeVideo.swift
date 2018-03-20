//
//  YoutubeVideo.swift
//  MenuHomeWorkouts
//
//  Created by Thanh on 27/02/2018.
//  Copyright © 2018 Thanh. All rights reserved.
//

import UIKit
import WebKit

class YoutubeVideo: UIViewController, UIWebViewDelegate {
    
//    let webView: UIWebView = {
//        let wv = UIWebView()
//        wv.backgroundColor = .red
//        return wv
//
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webV    = UIWebView()
        webV.frame  = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        webV.loadRequest(NSURLRequest(url: NSURL(string: "https://www.youtube.com/watch?v=iSSAk4XCsRA")! as URL) as URLRequest)
        webV.delegate = self
        self.view.addSubview(webV)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
