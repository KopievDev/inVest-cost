//
//  HomeScreen.swift
//  inVestCost
//
//  Created by Ivan Kopiev on 09.10.2021.
//

import UIKit
import Lottie
class HomeScreen: UIViewController {
    //MARK: - Properies
    @IBOutlet weak var animateView: AnimationView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // MARK: - Helpers
    func setUp() {
        animateView.animation =  Animation.named("tv")
        animateView.animationSpeed = 2
        animateView.loopMode = .loop
        animateView.play()
    }
    
  
}

