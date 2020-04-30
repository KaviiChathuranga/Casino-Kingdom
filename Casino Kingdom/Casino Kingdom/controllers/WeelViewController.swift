//
//  WeelViewController.swift
//  Casino Kingdom
//
//  Created by Treinetic Macbook004 on 8/27/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import UIKit
struct weelViewStruct{
    var itemList = Item()
    var marks = 0
    static var drawFilePath = MusicPlay(MusicName: "139001__jhka__revolver-chamber-spin-ratchet-sound-[AudioTrimmer.com]")
    var count = 0
}

protocol weelViewProtocol {
    func getLukyNumber(lukyNo: Int)
    func reSetAll()
}

class WeelViewController: UIViewController {
    var guesture : UIPanGestureRecognizer!
    var time = 13
    var dishTime = 0
    var timer = Timer()
    var structure = weelViewStruct()
    var delegate : weelViewProtocol?
    @IBOutlet weak var roundImg: UIImageView!
    
    @IBOutlet weak var ball: UIImageView!
    @IBOutlet weak var marksLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guesture = UIPanGestureRecognizer(target: self, action: #selector(didSwipe))
        self.view.addGestureRecognizer(guesture)
//        ball.layer.zPosition = -1087658762534732654;
        ball.transform = ball.transform.rotated(by: CGFloat(234273))


    }
    
    @objc func didSwipe(sender : UIPanGestureRecognizer) {
        
        if structure.count == 1{
            return
        }
        
        if sender.state == .ended {
            structure.count = 1
            
            let x = sender.velocity(in: self.view).x
            let y = sender.velocity(in: self.view).y
            let velocity = min(max(abs(x), abs(y)) * 0.3, 1000)
            let animation = CABasicAnimation.init(keyPath: "transform.rotation")
            animation.fromValue = velocity * -0.5
            let rotationTime = Double(velocity / 2.0).squareRoot()
            animation.duration = rotationTime
            self.dishTime = Int(rotationTime)
            self.time = Int(rotationTime) + 2
            weelViewStruct.drawFilePath.startMusic()
            animation.timingFunction = .init(controlPoints: 0.1, 0.67, 0.18, 1)
            self.ball.layer.add(animation, forKey: "transform.rotation")
            
            let d = Int.random(in: 1 ..< 37)
            structure.marks = d
            let angle = structure.itemList.itemArrary[d].angle
            self.ball.transform = CGAffineTransform.init(rotationAngle: CGFloat(angle))
            timer.invalidate()
            callTimer()
        }
    }
    
    func stopedWeel(value: Int){
        self.marksLbl.text = "\(value)"
    }
    
    func callTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(WeelViewController.action)), userInfo: nil, repeats: true)
    }
    
    @objc func action(){
        time -= 1
        if time-5 <= dishTime{
            weelViewStruct.drawFilePath.adjustMusic(Volume: 0.3)
        }
        if time-4 <= dishTime/2{
            weelViewStruct.drawFilePath.adjustMusic(Volume: 0.2)
        }
        if time-3 <= dishTime/3{
            weelViewStruct.drawFilePath.adjustMusic(Volume: 0.1)
        }
        if time <= 2{
            weelViewStruct.drawFilePath.stopMusic()
        }
        if time == 2{
            stopedWeel(value: structure.marks)
            UIView.transition(with: roundImg, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
        if time == 0{
           delegate?.getLukyNumber(lukyNo: structure.marks)
           delegate?.reSetAll()
           self.dismiss(animated: true, completion: nil)
           timer.invalidate()
           time = 11
        }
    }
}
