//
//  GameOverAlertViewController.swift
//  Casino Kingdom
//
//  Created by Treinetic Macbook004 on 8/28/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import UIKit

protocol gameOverProtoCol {
    func resetAgain()
}

class GameOverAlertViewController: UIViewController {

    var delegate : gameOverProtoCol?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func action(_ sender: Any) {
        delegate?.resetAgain()
        dismiss(animated: true, completion: nil)
    }
}
