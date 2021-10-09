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
        messageLabel.text = "Добрый день! Сегодня в банке ВТБ проходит акция "
        firstButton.layer.cornerRadius = 10
        secondButton.layer.cornerRadius = 10
    }

    @IBAction func didTapFirst(_ sender: Any) {
        if let vc = UIStoryboard(name: "WhatIf", bundle: nil).instantiateInitialViewController() as? WhatIf {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func didTapSecond(_ sender: Any) {
        if let vc = UIStoryboard(name: "WhatIf", bundle: nil).instantiateInitialViewController() as? WhatIf {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

