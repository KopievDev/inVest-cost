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
    var quest: Question?
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
        guard let question = quest else {return}
        configWith(question: question)
        
    }
    
    func configWith(question: Question) {
        questionLabel.text = question.question
        firstButton.setTitle(question.firstAnswer, for: .normal)
        secondButton.setTitle(question.secondAnswer, for: .normal)
        threeButton.setTitle(question.threeAnswer, for: .normal)
        fourButton.setTitle(question.fourAnswer, for: .normal)
        trueAnswer = question.trueAnswer
    }
    @IBAction func didTapOnThree(_ sender: Any) {
        guard let but = sender as? UIButton else {return}
        if but.tag == trueAnswer {
           let config = ModalViewConfigurator(action: { [weak self] in
            guard let self = self else {return}
                if let vc = UIStoryboard(name: "WhatIf", bundle: nil).instantiateInitialViewController() as? WhatIf {
                    vc.quest = questions[but.tag]
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }, title: "Поздравляем!", text: "Это правильный ответ!", subText: "", buttonText: "Дальше", animation: "yeah")
            ModalView.alert.show(with: config)
        } else {
            let config = ModalViewConfigurator(action: {
             }, title: "Ну такое...", text: "Попробуй еще", subText: "", buttonText: "Попробовать снова", animation: "error")
             ModalView.alert.show(with: config)
            
        }
    }
    

}

