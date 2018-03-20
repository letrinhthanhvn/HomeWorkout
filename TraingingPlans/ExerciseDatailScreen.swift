//
//  ExerciseDatailScreen.swift
//  HomeWorkouts
//
//  Created by Thanh on 01/02/2018.
//  Copyright © 2018 Thanh. All rights reserved.
//

import UIKit

import AVFoundation
import AVKit

//import YouTubePlayer

//class videoView: UIView {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        backgroundColor = UIColor.black
//
//        let path: String = Bundle.main.path(forResource: "Jumping Jacks - XFit Daily", ofType: "mp4")!
//        let videoURL = URL(fileURLWithPath: path)
//        let player = AVPlayer(url: videoURL)
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.bounds
//        self.layer.addSublayer(playerLayer)
//        player.play()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}

class ExerciseDetailScreen: UIView {
    
    var controller: ExerciseDetailController?
    
    var headerLabel: UILabel = {
        let header = UILabel()
        header.font = UIFont.systemFont(ofSize: 25)
        header.textAlignment = .center
        
        return header
    }()
    
    let bodyLabel: UILabel = {
       let bodyLabel = UILabel()
        bodyLabel.text = "Start in the regular push-up position but with your hands elevated on a chair or bench.\n\nThen push your body up down using your arm streng.\n\nRemember to keep your body straight."
        bodyLabel.textAlignment = .left
        bodyLabel.font = UIFont.systemFont(ofSize: 16)
        bodyLabel.numberOfLines = 0
        bodyLabel.textColor = UIColor.darkText
        bodyLabel.backgroundColor = UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 1)
        return bodyLabel
    }()
    
    let closeButton: UIButton = {
        let closeBtn = UIButton(type: UIButtonType.system)
        closeBtn.setTitle("Close", for: .normal)
        closeBtn.setTitleColor(UIColor.red, for: UIControlState.normal)
        return closeBtn
    }()
    
    let gifImage: UIImageView = {
       let gif = UIImageView()
        return gif
    }()
    
    let screen: UIView = {
        let screen = UIView()
        screen.backgroundColor = UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 1)
        screen.layer.cornerRadius = 16
        screen.layer.masksToBounds = true
        return screen
    }()
    
    let videoButton: UIButton = {
       let videoBtn = UIButton()
        videoBtn.setImage(UIImage(named: "videoImage"), for: UIControlState.normal)
        videoBtn.contentMode = .scaleAspectFill
//        videoBtn.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
//        videoBtn.layer.cornerRadius = 0.5 * videoBtn.bounds.size.width
        videoBtn.clipsToBounds = true
        videoBtn.layer.masksToBounds = true
//        videoBtn.addTarget(self, action: #selector(ExerciseDetailScreen.videoPress(_:)), for: .touchUpInside)
        
        return videoBtn
    }()
    
    func setupScreenView() {
        
        
        screen.frame = CGRect(x: 20, y: 100, width: (controller?.view.frame.width)! - 40, height: (controller?.view.frame.height)! - 200)
        
        
        
        gifImage.frame = CGRect(x: 0, y: 0, width: screen.frame.width
            , height: screen.frame.width * 9 / 15)
        gifImage.loadGif(name: "jumpingjacks")
        
        
        screen.addSubview(gifImage)
      
        screen.addSubview(headerLabel)
        headerLabel.frame = CGRect(x: 0, y: screen.frame.width * 9 / 16 + 12, width: screen.frame.width, height: 60)
        
        screen.addSubview(bodyLabel)
        bodyLabel.frame = CGRect(x: 10, y: screen.frame.width * 9 / 16 + 80, width: screen.frame.width - 20, height: 200)
        
        closeButton.frame = CGRect(x: screen.frame.width - 120, y: screen.frame.height - 70, width: 100, height: 50)
        closeButton.addTarget(self, action: #selector(self.pressClose(_:)), for: .touchUpInside)
        screen.addSubview(closeButton)
        
        // add videoButton
        screen.addSubview(videoButton)
        videoButton.layer.cornerRadius = 25
        videoButton.frame = CGRect(x: screen.frame.width - 60, y: 20, width: 50, height: 50)
        videoButton.addTarget(self, action: #selector(self.videoPress(_:)), for: .touchUpInside)
    
        
//        screen.addSubview(viewVideo)
//        viewVideo.frame = CGRect(x: 0, y: 0, width: screen.frame.width
//            , height: screen.frame.width * 9 / 15)
    }
    
    let blackView = UIView()

    func showScreen() {
        
        
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        blackView.alpha = 0
        
        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pressClose)))
        
        let screenWidth = controller?.view.frame.width
        let screenHeight = controller?.view.frame.height
        blackView.frame = CGRect(x: 0 , y: 0, width: screenWidth!, height: screenHeight! )
        screen.isHidden = false
        
        controller?.view.addSubview(blackView)
        
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 1
            self.blackView.addSubview(self.screen)
            self.setupScreenView()
        }
        
        
        print("Clicked")
    }

    @objc func pressClose(_ sender: UIButton) {
        print("Hello")
        UIView.animate(withDuration: 0.5) {
            self.screen.isHidden = true
            self.blackView.alpha = 0
        }
//        player.pause()
    }
    
    var playerController: AVPlayerViewController!
    
    var player = AVPlayer()
    
    
    
    @objc func videoPress(_ sender: UIButton) {
        print("hi")
        
        let youtubeVideo = YoutubeVideo()
        
        controller?.navigationController?.pushViewController(youtubeVideo, animated: true)
        
        
        
//        playerController = AVPlayerViewController()
//        let path: String = Bundle.main.path(forResource: "Jumping Jacks - XFit Daily", ofType: "mp4")!
//        let url:URL = URL(fileURLWithPath: path)
//        playerController.player = AVPlayer(url: url)
//        controller?.present(playerController, animated: true, completion: {
//            self.playerController.player?.play()
//        })
        
//        let youtubeURL:NSURL? = NSURL(fileURLWithPath: "https://youtu.be/iSSAk4XCsRA")
//
//        if let url = youtubeURL {
//            self.player = AVPlayer(url: url as URL)
//            self.playerController.player = self.player
//        }
//
//        controller?.present(playerController, animated: true, completion: {
//            self.playerController.player?.play()
//        })
        
        }
}
