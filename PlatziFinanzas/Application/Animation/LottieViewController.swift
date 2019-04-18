//
//  LottieViewController.swift
//  PlatziFinanzas
//
//  Created by 松岡裕介 on 2019/04/08.
//  Copyright © 2019 Platzi. All rights reserved.
//

import UIKit
import Lottie


class LottieViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.animation = Animation.named("day-of-the-dead-skull")
        animationView.loopMode = LottieLoopMode.loop
        animationView.play()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
