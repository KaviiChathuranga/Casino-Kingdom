//
//  BetCardController.swift
//  Casino Kingdom
//
//  Created by Treinetic Macbook004 on 8/27/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import Foundation
import UIKit

protocol BetCardProtocol {
    func betCardAction(type: String!, button: UIButton!)
}

class BetCardController : UIView {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var button: UIButton!
    var betDelegate : BetCardProtocol!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initXib()
    }
    
    private func initXib() {
        let nib = UINib.init(nibName: "BetCard", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    func setBoder(){
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.white.cgColor
    }
    func changeButtonName(txt: String!){
        button.setTitle(txt, for: .normal)
        setBoder()
    }
    
    func setBackgroundColor(color: UIColor){
        button.backgroundColor = color
        setBoder()
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
    
        if button.titleLabel?.text! == " " {
            betDelegate.betCardAction(type: " ",button: button)
        }
        if button.titleLabel?.text! == "  " {
            betDelegate.betCardAction(type: "  ",button: button)
        }
        if button.titleLabel?.text! == "EVEN" {
            betDelegate.betCardAction(type: "EVEN",button: button)
        }
        if button.titleLabel?.text! == "1 - 18" {
            betDelegate.betCardAction(type: "1 - 18",button: button)
        }
        if button.titleLabel?.text! == "ODD" {
            betDelegate.betCardAction(type: "ODD",button: button)
        }
        if button.titleLabel?.text! == "19 - 36" {
            betDelegate.betCardAction(type: "19 - 36",button: button)
        }
       
    }
}
