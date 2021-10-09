//
//  MapView.swift
//  inVestCost
//
//  Created by Leonid Safronov on 09.10.2021.
//

import UIKit

class MapView: UIView {
    @IBOutlet private var mapImg: UIImageView!
    
    @IBOutlet private var bankImg: UIImageView!
    @IBOutlet private var homeImg: UIImageView!
    @IBOutlet private var coffeeImg: UIImageView!
    @IBOutlet private var universityImg: UIImageView!
    
    @IBOutlet private var bancV: UIView!
    @IBOutlet private var homeV: UIView!
    @IBOutlet private var coffeeV: UIView!
    @IBOutlet private var universityV: UIView!
    
    @IBOutlet var nickLbl: UILabel!
    @IBOutlet var moneyLbl: UILabel!
    
    @IBOutlet var infoV: UIView!
    @IBOutlet var infoLbl: UILabel!
    
    private var structures: [(img: UIImageView, v: UIView)] { return [(bankImg, bancV), (homeImg, homeV), (coffeeImg, coffeeV), (universityImg, universityV)] }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        addGestureRecognizer(tap)
    }
    
    func render(money: Int, nick: String) {
        nickLbl.text = nick
        moneyLbl.text = String(money) + " у.е."
    }
    
    func selectStructure(structureID: MapViewController.StructureID) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            self.mapImg.alpha = 0.5
            
            for i in 0..<self.structures.count {
                if i == structureID.rawValue {
                    self.structures[i].img.alpha = 1
                    self.structures[i].v.alpha = 1
                } else {
                    self.structures[i].img.alpha = 0.5
                    self.structures[i].v.alpha = 0.5
                }
            }
            
            self.infoV.alpha = 1
            self.infoV.isUserInteractionEnabled = true
            
            self.setIntfo(structureID: structureID)
        }
    }
    
    private func setIntfo(structureID: MapViewController.StructureID) {
        var text = "Желаете перейти в локацию "
        
        switch structureID {
        case .bank:
           text += "Банк"
        case .home:
            text += "Дом"
        case .coffee:
            text += "Кафе"
        case .university:
            text += "Университет"
        }
        
        text += "?"
        
        infoLbl.text = text
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            
            self.mapImg.alpha = 1

            for i in 0..<self.structures.count {
                self.structures[i].img.alpha = 1
                self.structures[i].v.alpha = 1
            }
            
            self.infoV.alpha = 0
            self.infoV.isUserInteractionEnabled = false
        }
    }
}

