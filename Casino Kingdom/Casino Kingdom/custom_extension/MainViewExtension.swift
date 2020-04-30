
import Foundation
import UIKit
class MainViewExtension{}

extension ViewController {
    func changeViews(){
        view1.changeButtonName(txt: "1 - 18")
        view2.changeButtonName(txt: "EVEN")
        view3.setBackgroundColor(color: UIColor.red)
        view3.changeButtonName(txt: " ")
        view4.setBackgroundColor(color: UIColor.black)
        view4.changeButtonName(txt: "  ")
        view5.changeButtonName(txt: "ODD")
        view6.changeButtonName(txt: "19 - 36")
    }
    func setDelegate(){
        view1.betDelegate = self
        view2.betDelegate = self
        view3.betDelegate = self
        view4.betDelegate = self
        view5.betDelegate = self
        view6.betDelegate = self
    }
    func setBoders(){
        firstTo12Btn.layer.borderColor = UIColor.white.cgColor
        firstTo12Btn.layer.borderWidth = 1
        
        secondTo12Btn.layer.borderColor = UIColor.white.cgColor
        secondTo12Btn.layer.borderWidth = 1
        
        thirdTo12Btn.layer.borderColor = UIColor.white.cgColor
        thirdTo12Btn.layer.borderWidth = 1
    }
    func loadFirstStacks(){
        let values = structure.rouletteNumbers.row1Items
        for x in 0 ... values.count-1{
            let uiView = BetBtnController()
            uiView.betDelegate = self
            let button = uiView.btn!
            button.isEnabled = true
            if UIDevice.current.model == "iPhone"{
                button.titleLabel?.font =  UIFont(name: "Kefa", size: 15)
            }else{
                button.titleLabel?.font =  UIFont(name: "Kefa", size: 22)
            }
            button.setTitle(values[x].number, for: .normal)
            if values[x].colour == "red"{
                button.backgroundColor = UIColor.red
            }
            if values[x].colour == "black"{
                button.backgroundColor = UIColor.black
            }
            if values[x].colour == ""{
            }
            firstStack.addArrangedSubview(uiView)
        }
    }
    func loadSecondStacks(){
        let values = structure.rouletteNumbers.row2Items
        for x in 0 ... values.count-1{
            let uiView = BetBtnController()
            uiView.betDelegate = self
            let button = uiView.btn!
            button.isEnabled = true
            if UIDevice.current.model == "iPhone"{
                button.titleLabel?.font =  UIFont(name: "Kefa", size: 15)
            }else{
                button.titleLabel?.font =  UIFont(name: "Kefa", size: 22)
            }
            
            button.setTitle(values[x].number, for: .normal)
            if values[x].colour == "red"{
                button.backgroundColor = UIColor.red
            }
            if values[x].colour == "black"{
                button.backgroundColor = UIColor.black
            }
            if values[x].colour == ""{
                
            }
            secondStack.addArrangedSubview(uiView)
        }
    }
    func loadThirdStacks(){
        let values = structure.rouletteNumbers.row3Items
        for x in 0 ... values.count-1{
            let uiView = BetBtnController()
            uiView.betDelegate = self
            let button = uiView.btn!
            button.isEnabled = true
            if UIDevice.current.model == "iPhone"{
                button.titleLabel?.font =  UIFont(name: "Kefa", size: 15)
            }else{
                button.titleLabel?.font =  UIFont(name: "Kefa", size: 22)
            }
            button.setTitle(values[x].number, for: .normal)
            if values[x].colour == "red"{
                button.backgroundColor = UIColor.red
            }
            if values[x].colour == "black"{
                button.backgroundColor = UIColor.black
            }
            if values[x].colour == ""{
                
            }
            lastStack.addArrangedSubview(uiView)
        }
    }
    
}


extension ViewController: BetBtnControllerProtocol{
    
    func betButtonAction(type: String!, button: UIButton!) {
         ViewControllerStruct.clickFilePath.startOneTimeMusic()
        if type == "1of 1" || type == "1of 2" || type == "1of 3" {
            setMiddleButtonBackgrounds(button: button)
            currenttopBtn = button
         }else{
            structure.guessLukyNo = Int(button.titleLabel!.text!)!
            currentMiddleBtn.layer.borderColor = UIColor.clear.cgColor
            setMiddleButtonBackgrounds(button: button)
            currentMiddleBtn = button
        }
        currentMiddleBtn.layer.opacity = 1
        currentMiddleBtn.isEnabled = true
        setMiddleButtonBackgrounds(button: button)
    }
}

extension ViewController: BetCardProtocol{
    func betCardAction(type: String!, button: UIButton!) {
         ViewControllerStruct.clickFilePath.startOneTimeMusic()
        if type == "EVEN" {
            currentBottomBtn.backgroundColor = background
            currentBottomBtn.layer.opacity = 1
            currentBottomBtn.isEnabled = true
            setButtonBackgrounds(button: button)
            currentBottomBtn = button
            setButtonBackgrounds(button: button)
            structure.lastArray.removeAll()
            for x in 0 ... structure.rouletteNumbers.row1Items.count-2 {
                let y = Int(structure.rouletteNumbers.row1Items[x].number)! % 2
                if y == 0{
                    structure.lastArray.append(structure.rouletteNumbers.row1Items[x])
                }
            }
            for x in 0 ... structure.rouletteNumbers.row2Items.count-2 {
                let y = Int(structure.rouletteNumbers.row2Items[x].number)! % 2
                if y == 0{
                    structure.lastArray.append(structure.rouletteNumbers.row2Items[x])
                }
            }
            for x in 0 ... structure.rouletteNumbers.row3Items.count-2 {
                let y = Int(structure.rouletteNumbers.row3Items[x].number)! % 2
                if y == 0{
                    structure.lastArray.append(structure.rouletteNumbers.row3Items[x])
                }
            }
        }
        
        if type == "1 - 18" {
            structure.lastArray.removeAll()
            for x in 0 ... 5 {
                structure.lastArray.append(structure.rouletteNumbers.row3Items[x])
                structure.lastArray.append(structure.rouletteNumbers.row2Items[x])
                structure.lastArray.append(structure.rouletteNumbers.row1Items[x])
            }
            currentBottomBtn.backgroundColor = background
            currentBottomBtn.layer.opacity = 1
            currentBottomBtn.isEnabled = true
            setButtonBackgrounds(button: button)
            currentBottomBtn = button
            setButtonBackgrounds(button: button)
        }
        
        if type == "ODD" {
            structure.lastArray.removeAll()
            for x in 0 ... structure.rouletteNumbers.row1Items.count-2 {
                let y = Int(structure.rouletteNumbers.row1Items[x].number)! % 2
                if y == 1{
                    structure.lastArray.append(structure.rouletteNumbers.row1Items[x])
                }
            }
            for x in 0 ... structure.rouletteNumbers.row2Items.count-2 {
                let y = Int(structure.rouletteNumbers.row2Items[x].number)! % 2
                if y == 1{
                    structure.lastArray.append(structure.rouletteNumbers.row2Items[x])
                }
            }
            for x in 0 ... structure.rouletteNumbers.row3Items.count-2 {
                let y = Int(structure.rouletteNumbers.row3Items[x].number)! % 2
                if y == 1{
                    structure.lastArray.append(structure.rouletteNumbers.row3Items[x])
                }
            }
            currentBottomBtn.backgroundColor = background
            currentBottomBtn.layer.opacity = 1
            currentBottomBtn.isEnabled = true
            setButtonBackgrounds(button: button)
            currentBottomBtn = button
            setButtonBackgrounds(button: button)
        }
        
        if type == "19 - 36" {
            structure.lastArray.removeAll()
            for x in 6 ... 11 {
                structure.lastArray.append(structure.rouletteNumbers.row3Items[x])
                structure.lastArray.append(structure.rouletteNumbers.row2Items[x])
                structure.lastArray.append(structure.rouletteNumbers.row1Items[x])
            }
            currentBottomBtn.backgroundColor = background
            if currentBottomBtn.titleLabel?.text == "  "{
            }
            currentBottomBtn.layer.opacity = 1
            currentBottomBtn.isEnabled = true
            setButtonBackgrounds(button: button)
            currentBottomBtn = button
            setButtonBackgrounds(button: button)
        }
        if type == " " {
            structure.lastArray.removeAll()
            for x in 0 ... structure.rouletteNumbers.row1Items.count-1 {
                if structure.rouletteNumbers.row1Items[x].colour == "red" {
                    structure.lastArray.append(structure.rouletteNumbers.row1Items[x])
                }
            }
            for x in 0 ... structure.rouletteNumbers.row2Items.count-1 {
                if structure.rouletteNumbers.row2Items[x].colour == "red" {
                    structure.lastArray.append(structure.rouletteNumbers.row2Items[x])
                }
            }
            for x in 0 ... structure.rouletteNumbers.row3Items.count-1 {
                if structure.rouletteNumbers.row3Items[x].colour == "red" {
                    structure.lastArray.append(structure.rouletteNumbers.row3Items[x])
                }
            }
            currentBottomBtn.backgroundColor = background
            currentBottomBtn.layer.opacity = 1
            currentBottomBtn.isEnabled = true
            setButtonBackgrounds(button: button)
            currentBottomBtn = button
            setButtonBackgrounds(button: button)
        }
        if type == "  " {
            structure.lastArray.removeAll()
            for x in 0 ... structure.rouletteNumbers.row1Items.count-1 {
                if structure.rouletteNumbers.row1Items[x].colour == "black" {
                    structure.lastArray.append(structure.rouletteNumbers.row1Items[x])
                }
            }
            for x in 0 ... structure.rouletteNumbers.row2Items.count-1 {
                if structure.rouletteNumbers.row2Items[x].colour == "black" {
                    structure.lastArray.append(structure.rouletteNumbers.row2Items[x])
                }
            }
            for x in 0 ... structure.rouletteNumbers.row3Items.count-1 {
                if structure.rouletteNumbers.row3Items[x].colour == "black" {
                    structure.lastArray.append(structure.rouletteNumbers.row3Items[x])
                }
            }
            currentBottomBtn.backgroundColor = background
            currentBottomBtn.layer.opacity = 1
            currentBottomBtn.isEnabled = true
            setButtonBackgrounds(button: button)
            currentBottomBtn = button
            setButtonBackgrounds(button: button)
        }
    }
    func setButtonBackgrounds(button: UIButton!){
        if currentBottomBtn == button {
            view4.setBackgroundColor(color: UIColor.black)
            view3.setBackgroundColor(color: UIColor.red)
            currentBottomBtn.backgroundColor = UIColor.blue
            currentBottomBtn.layer.opacity = 0.5
        }
    }
    func setMiddleButtonBackgrounds(button: UIButton!){
        if currentMiddleBtn == button  {
            currentMiddleBtn.layer.borderWidth = 4
            currentMiddleBtn.layer.borderColor = UIColor.blue.cgColor
            currentMiddleBtn.layer.opacity = 1
        }
        if (button.titleLabel?.text == "1of 1" || button.titleLabel?.text == "1of 2" || button.titleLabel?.text == "1of 3"){
        }
        oneOfTwo.layer.borderColor = UIColor.clear.cgColor
        oneOfThree.layer.borderColor = UIColor.clear.cgColor
        oneOfOne.layer.borderColor = UIColor.clear.cgColor
        if button.titleLabel?.text == "1of 1"{
            structure.rightTopArray = structure.rouletteNumbers.row1Items
            oneOfTwo.backgroundColor = UIColor.clear
            oneOfThree.backgroundColor = UIColor.clear
            oneOfOne.backgroundColor = UIColor.blue
            oneOfOne = button
        }
        if button.titleLabel?.text == "1of 2"{
            structure.rightTopArray = structure.rouletteNumbers.row2Items
            oneOfOne.backgroundColor = UIColor.clear
            oneOfThree.backgroundColor = UIColor.clear
            oneOfTwo.backgroundColor = UIColor.blue
            oneOfTwo = button
        }
        if button.titleLabel?.text == "1of 3"{
            structure.rightTopArray = structure.rouletteNumbers.row3Items
            oneOfTwo.backgroundColor = UIColor.clear
            oneOfOne.backgroundColor = UIColor.clear
            oneOfThree.backgroundColor = UIColor.blue
            oneOfThree = button
        }
    }
}

extension ViewController : weelViewProtocol{
    func reSetAll() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.currentBottomBtn.backgroundColor = self.background
            self.currentBottomBtn.layer.opacity = 1
            self.currentBottomBtn.isEnabled = true
            self.currenttopBtn.backgroundColor = self.background
            self.currenttopBtn.layer.opacity = 1
            self.currenttopBtn.isEnabled = true
            self.currentBtn.backgroundColor = self.background
            self.currentBtn.layer.opacity = 1
            self.currentBtn.isEnabled = true
            self.structure.fullArray.removeAll()
            self.structure.middleArray.removeAll()
            self.structure.lastArray.removeAll()
            self.structure.lukyNo = 0
            self.structure.guessLukyNo = 0
            self.structure.rightTopArray.removeAll()
            self.structure.testLoop = 0
            self.oneOfThree.backgroundColor = UIColor.clear
            self.oneOfTwo.backgroundColor = UIColor.clear
            self.oneOfOne.backgroundColor = UIColor.clear
            self.currentMiddleBtn.layer.borderColor = UIColor.clear.cgColor
            self.view3.backgroundColor = UIColor.red
            self.view4.backgroundColor = UIColor.black
            self.betLbl.text = "$5"
        }
    }
    func getLukyNumber(lukyNo: Int) {
        structure.lukyNo = lukyNo
        structure.testLoop = 0
        if structure.fullArray.count != 0{
            for x in 0 ... structure.fullArray.count-1{
                if structure.lukyNo == Int(structure.fullArray[x].number) || structure.lukyNo == structure.guessLukyNo {
                    structure.testLoop = 1
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        callWinner()
                        return
                    }
                    return
                }
            }
        }else{
            if structure.lukyNo == structure.guessLukyNo {
                structure.testLoop = 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    callWinner()
                    return
                }
                return
            }
        }
        if structure.testLoop == 0 {
            let betLblprice = betLbl.text as! String
            var value = betLblprice.split{$0 == "$"}.map(String.init)
            let number: String = value[0]
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                if (self.structure.realPrice) < 5 {
                    self.performSegue(withIdentifier: "gameOverIdentifier", sender: nil)
                    return
                }
            }
            self.structure.realPrice = self.structure.realPrice - Int(number)!
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.coinLblBtn.titleLabel?.text = "Coins : $ \(self.structure.realPrice)"
            }
        }
        func callWinner(){
            ViewControllerStruct.drawFilePath.startOneTimeMusic()
            let betLblprice = betLbl.text as! String
            var value = betLblprice.split{$0 == "$"}.map(String.init)
            let number: String = value[0]
            if structure.fullArray.count != 0{
                for x in 0 ... structure.fullArray.count-1 {
                    if structure.lukyNo == Int(structure.fullArray[x].number){
                        self.structure.realPrice = self.structure.realPrice + (Int(number)!)
                    }
                }
            }
            if structure.guessLukyNo == structure.lukyNo{
                 self.structure.realPrice = self.structure.realPrice + (Int(number)!)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.coinLblBtn.titleLabel?.text = "Coins : $ \(self.structure.realPrice)"
            }
            self.coinLblBtn.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            UIView.animate(withDuration: 2.0,
                           delay: 0,
                           usingSpringWithDamping: 0.2,
                           initialSpringVelocity: 6.0,
                           options: .allowUserInteraction,
                           animations: { [weak self] in
                            self!.coinLblBtn.transform = .identity},
            completion: nil)}
    }
}

extension ViewController: gameOverProtoCol{
    func resetAgain() {
        structure.realPrice = 100
        coinLblBtn.titleLabel?.text = "Coins : $ 100"
        betLbl.text = "$5"
    }
}
