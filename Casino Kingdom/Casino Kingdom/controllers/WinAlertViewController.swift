//
//  WinAlertViewController.swift
//  Casino Kingdom
//
//  Created by Treinetic Macbook004 on 8/28/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import UIKit

class WinAlertViewController: UIViewController {
    var time = 6
    var timer = Timer()
    var winPrice = ""
    @IBOutlet weak var priceLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceLbl.text = winPrice
        callTimer()
    }
    
    func callTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(WinAlertViewController.action)), userInfo: nil, repeats: true)
    }
    
    @objc func action(){
        time -= 1
        if time == 3{
            self.dismiss(animated: true, completion: nil)
            timer.invalidate()
        }
    }

}
