//
//  SplashScreenViewController.swift
//  poi
//
//  Created by Teknasyon-S on 25.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import UIKit
import AVKit

class SplashScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func poiBackgroundClick(_ sender: UIButton) {
        performSegue(withIdentifier: "mapViewController", sender: nil)
    }
    @IBAction func poiLogoClick(_ sender: UIButton) {
        performSegue(withIdentifier: "mapViewController", sender: nil)
    }
    @IBAction func clickButton(_ sender: UIButton) {
        performSegue(withIdentifier: "mapViewController", sender: nil)
    }
}
