//
//  WhatIf.swift
//  inVestCost
//
//  Created by Ivan Kopiev on 09.10.2021.
//

import UIKit
import Lottie
struct Question {
    let question: String
    let firstAnswer: String
    let secondAnswer: String
    let threeAnswer: String
    let fourAnswer: String
    let trueAnswer: Int
}

class WhatIf: UIViewController {
    //MARK: - Properies
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    
    var trueAnswer = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // MARK: - Helpers
    func setUp() {
        firstButton.layer.cornerRadius = 10
        secondButton.layer.cornerRadius = 10
        threeButton.layer.cornerRadius = 10
        fourButton.layer.cornerRadius = 10
        
        
    }
    
    func configWith(question: Question) {
        questionLabel.text = question.question
        firstButton.setTitle(question.firstAnswer, for: .normal)
        secondButton.setTitle(question.secondAnswer, for: .normal)
        threeButton.setTitle(question.threeAnswer, for: .normal)
        fourButton.setTitle(question.fourAnswer, for: .normal)
        trueAnswer = question.trueAnswer
    }
    
    @IBAction func didTapOnFour(_ sender: Any) {
        guard let but = sender as? UIButton else {return}
        if but.tag == trueAnswer {
            ModalView.alert.present()
        }
        print(but.tag)
    }
    @IBAction func didTapOnThree(_ sender: Any) {
        guard let but = sender as? UIButton else {return}
        if but.tag == trueAnswer {
            ModalView.alert.present()
        }
    }
    @IBAction func didTapOnSecond(_ sender: Any) {
        guard let but = sender as? UIButton else {return}
        if but.tag == trueAnswer {
            ModalView.alert.present()
        }
    }
    @IBAction func didTapOnFirst(_ sender: Any) {
        guard let but = sender as? UIButton else {return}
        if but.tag == trueAnswer {
            ModalView.alert.present()
        }
    }
    

}

