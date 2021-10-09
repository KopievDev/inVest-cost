//
//  MapViewController.swift
//  inVestCost
//
//  Created by Leonid Safronov on 09.10.2021.
//

import UIKit

class MapViewController: UIViewController {
    
    enum StructureID: Int {
        case bank = 0
        case home = 1
        case coffee = 2
        case university = 3
    }
    
    @IBOutlet var v: MapView!
    
    private var currentStructure = StructureID.bank
    private var nick: String = ""
    private var money: Int = 0
    
    func setNick(_ nick: String) {
        self.nick = nick
    }
    
    func setMoney(_ money: Int) {
        self.money = money
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        v.render(money: money, nick: nick)
    }
    
    @IBAction private func bancBtnPressed(_ sender: UIButton) {
        let id = StructureID.bank
        v.selectStructure(structureID: id)
        currentStructure = id
    }
    
    @IBAction private func homeBtnPressed(_ sender: UIButton) {
        let id = StructureID.home
        v.selectStructure(structureID: id)
        currentStructure = id
    }
    
    @IBAction private func coffeeBtnPressed(_ sender: UIButton) {
        let id = StructureID.coffee
        v.selectStructure(structureID: id)
        currentStructure = id
    }
    
    @IBAction private func universityBtnPressed(_ sender: UIButton) {
        let id = StructureID.university
        v.selectStructure(structureID: id)
        currentStructure = id
    }
    
    @IBAction private func noBtnPressed(_ sender: UIButton) {
        v.handleTap()
    }
    
    @IBAction private func yesBtnPressed(_ sender: UIButton) {
        // тута замутить переходы
        switch currentStructure {
        case .bank:
            print("В банк")
        case .home:
            print("В дом")
        case .coffee:
            print("В кафе")
        case .university:
            print("В университет")
        }
    }
}
