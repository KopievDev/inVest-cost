//
//  Launch.swift
//  inVestCost
//
//  Created by Ivan Kopiev on 09.10.2021.
//

import UIKit

class Launch: UIViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var ageTextfield: UITextField!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var incomeTextfield: UITextField!
    @IBOutlet weak var safeMoneyTextfield: UITextField!
    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        navigationController?.navigationBar.isHidden = true
        femaleButton.layer.cornerRadius = 20
        maleButton.layer.cornerRadius = 20
        goButton.layer.cornerRadius = 10
        
    }
    
    @IBAction func goHome(_ sender: Any) {
        if let vc = UIStoryboard(name: "HomeScreen", bundle: nil).instantiateInitialViewController() as? HomeScreen {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


