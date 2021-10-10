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
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var animateView: AnimationView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
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
        messageLabel.text = "Добрый день! Вам интересно пройти викторину \n'А что если бы?'"
        firstButton.layer.cornerRadius = 10
        secondButton.layer.cornerRadius = 10
    }

    @IBAction func didTapFirst(_ sender: Any) {
        if let vc = UIStoryboard(name: "WhatIf", bundle: nil).instantiateInitialViewController() as? WhatIf {
            vc.quest = questions[0]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func didTapSecond(_ sender: Any) {
        guard let vc = UIStoryboard(name: "Map", bundle: nil).instantiateInitialViewController() as? MapViewController else {return}
            self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

