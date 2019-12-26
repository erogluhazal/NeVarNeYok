//
//  LaunchScreenViewController.swift
//  poi
//
//  Created by Teknasyon-S on 27.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import UIKit
import AVKit

class LaunchScreenViewController: UIViewController {

    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadVideo()
        // Do any additional setup after loading the view.
    }
    private func loadVideo() {
        //this line is important to prevent background music stop
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
        } catch { }
        let path = Bundle.main.path(forResource: "video", ofType:"mp4")
        let video = AVPlayer(url: URL(fileURLWithPath: path!))
        let playerLayer = AVPlayerViewController()
        playerLayer.player = video
        player?.seek(to: CMTime.zero)
        present(playerLayer, animated: true, completion: {
            video.play()
        })
    }
}
