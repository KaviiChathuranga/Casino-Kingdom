
import UIKit

struct ViewControllerStruct {
    var rouletteNumbers = RouletteNumbers()
    var lukyNo = 0
    var rightTopArray = [RouletteNumbers]()
    var middleArray = [RouletteNumbers]()
    var lastArray = [RouletteNumbers]()
    var fullArray = [RouletteNumbers]()
    var realPrice = 100
    var testLoop = 0
    var guessLukyNo = 0
    static var drawFilePath = MusicPlay(MusicName: "little_robot_sound_factory_Jingle_Win_Synth_06")
    static var clickFilePath = MusicPlay(MusicName: "tape-recorder-eject-1",MusicType: ".wav")
}
class ViewController: UIViewController {
    @IBOutlet weak var view1: BetCardController!
    @IBOutlet weak var view2: BetCardController!
    @IBOutlet weak var view3: BetCardController!
    @IBOutlet weak var view4: BetCardController!
    @IBOutlet weak var view5: BetCardController!
    @IBOutlet weak var view6: BetCardController!
    @IBOutlet weak var coinLblBtn: UIButton!
    @IBOutlet weak var firstTo12Btn: UIButton!
    @IBOutlet weak var secondTo12Btn: UIButton!
    @IBOutlet weak var thirdTo12Btn: UIButton!
    @IBOutlet weak var lastStack: UIStackView!
    @IBOutlet weak var secondStack: UIStackView!
    @IBOutlet weak var firstStack: UIStackView!
    var structure = ViewControllerStruct()
    var currentBtn = UIButton()
    var currenttopBtn = UIButton()
    var currentBottomBtn = UIButton()
    var background = UIColor()
    var currentMiddleBtn = UIButton()
    var middleBtnBackground = UIColor()
    @IBOutlet weak var betLbl: UILabel!
    var defaultValue = 10
    var row1Btn = UIButton()
    var row2Btn = UIButton()
    var row3Btn = UIButton()
    var oneOfOne = UIButton()
    var oneOfTwo = UIButton()
    var oneOfThree = UIButton()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeViews()
        setDelegate()
        setBoders()
        loadFirstStacks()
        loadSecondStacks()
        loadThirdStacks()
        getBackground()
    }
    @IBAction func decreaseBetAction(_ sender: Any) {
        let value = betLbl.text as! String
        if value == "$5"{
            return
        }
        var fullValue = value.split{$0 == "$"}.map(String.init)
        let number: String = fullValue[0]
        defaultValue = Int(number)! - 5
        betLbl.text = "$"+"\(defaultValue)"
    }
    @IBAction func increaseBetAction(_ sender: Any) {
        let value = betLbl.text as! String
        var fullValue = value.split{$0 == "$"}.map(String.init)
        let number: String = fullValue[0]
        defaultValue = Int(number)! + 5
        if structure.realPrice < defaultValue {
            return
        }
        betLbl.text = "$"+"\(defaultValue)"
    }
    @IBAction func spinAction(_ sender: Any) {
        let betLblprice = betLbl.text as! String
        var value = betLblprice.split{$0 == "$"}.map(String.init)
        let number: String = value[0]
        if self.structure.realPrice <= Int(number)! {
            performSegue(withIdentifier: "gameOverIdentifier", sender: nil)
            return
        }
        structure.fullArray.removeAll()
        if structure.middleArray.count != 0{
            for x in 0 ... structure.middleArray.count-1{
                structure.fullArray.append(structure.middleArray[x])
            }
        }
        if structure.rightTopArray.count != 0{
            for x in 0 ... structure.rightTopArray.count-1{
                structure.fullArray.append(structure.rightTopArray[x])
            }
        }
        if structure.lastArray.count != 0{
            for x in 0 ... structure.lastArray.count-1{
                structure.fullArray.append(structure.lastArray[x])
            }
        }
        if structure.fullArray.count != 0 || structure.guessLukyNo != 0 {
            performSegue(withIdentifier: "weelIdentifier", sender: nil)
        }
    }
    
    // right buttons
    @IBAction func firstRowOfOneAction(_ sender: Any) {
    }
    @IBAction func secondRowOfOneAction(_ sender: Any) {
    }
    @IBAction func thirdRowOfOneAction(_ sender: Any) {
    }
    
    // bottom button
    @IBAction func firstTo12Action(_ sender: Any) {
        ViewControllerStruct.clickFilePath.startOneTimeMusic()
        currentBtn = firstTo12Btn
        setMiddleButtonClick(button: firstTo12Btn)
        structure.middleArray.removeAll()
        for x in 0 ... 3 {
            structure.middleArray.append(structure.rouletteNumbers.row3Items[x])
            structure.middleArray.append(structure.rouletteNumbers.row2Items[x])
            structure.middleArray.append(structure.rouletteNumbers.row1Items[x])
        }
    }
    @IBAction func secondTo12Action(_ sender: Any) {
        ViewControllerStruct.clickFilePath.startOneTimeMusic()
        currentBtn = secondTo12Btn
        setMiddleButtonClick(button: secondTo12Btn)
        structure.middleArray.removeAll()
        for x in 4 ... 7 {
            structure.middleArray.append(structure.rouletteNumbers.row3Items[x])
            structure.middleArray.append(structure.rouletteNumbers.row2Items[x])
            structure.middleArray.append(structure.rouletteNumbers.row1Items[x])
        }
    }
    @IBAction func thirdTo12Action(_ sender: Any) {
        ViewControllerStruct.clickFilePath.startOneTimeMusic()
        currentBtn = thirdTo12Btn
        setMiddleButtonClick(button: thirdTo12Btn)
        structure.middleArray.removeAll()
        for x in 8 ... 11 {
            structure.middleArray.append(structure.rouletteNumbers.row3Items[x])
            structure.middleArray.append(structure.rouletteNumbers.row2Items[x])
            structure.middleArray.append(structure.rouletteNumbers.row1Items[x])
        }
    }
    func setMiddleButtonClick(button: UIButton!){
        ViewControllerStruct.clickFilePath.startOneTimeMusic()
        if currentBtn == button {
            currentBtn.isEnabled = false
            currentBtn.backgroundColor = UIColor.blue
            currentBtn.layer.opacity = 0.5
        }
            if firstTo12Btn != currentBtn{
                firstTo12Btn.isEnabled = true
                firstTo12Btn.layer.opacity = 10
                firstTo12Btn.backgroundColor = background
            }
            if secondTo12Btn != currentBtn{
                secondTo12Btn.isEnabled = true
                secondTo12Btn.layer.opacity = 10
                secondTo12Btn.backgroundColor = background
            }
            if thirdTo12Btn != currentBtn{
                thirdTo12Btn.isEnabled = true
                thirdTo12Btn.layer.opacity = 10
                thirdTo12Btn.backgroundColor = background
            }
    }
    func setTopBtnClick(button: UIButton!){
        if currenttopBtn == button {
            currenttopBtn.isEnabled = false
            currenttopBtn.backgroundColor = UIColor.blue
            currenttopBtn.layer.opacity = 0.5
        }
        if row1Btn != currenttopBtn{
            row1Btn.isEnabled = true
            row1Btn.layer.opacity = 10
            row1Btn.backgroundColor = background
        }
        if row2Btn != currenttopBtn{
            row2Btn.isEnabled = true
            row2Btn.layer.opacity = 10
            row2Btn.backgroundColor = background
        }
        if row3Btn != currenttopBtn{
            row3Btn.isEnabled = true
            row3Btn.layer.opacity = 10
            row3Btn.backgroundColor = background
        }
    }
    func getBackground(){
        background = firstTo12Btn.backgroundColor!
    }
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "weelIdentifier"{
            let controller = segue.destination as! WeelViewController
            controller.delegate = self
        }
        if segue.identifier == "gameOverIdentifier"{
            let controller = segue.destination as! GameOverAlertViewController
            controller.delegate = self
        }
    }
}
