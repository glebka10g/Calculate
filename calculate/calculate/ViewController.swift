import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let secondVC = SecondViewController()
    var historyCalculate: [String] = []
    var minusAction = 0
    var deleteAction = 0
    var plusAction = 0
    var multiplyAction = 0
    var procentAction = 0
    var plusMinus = true
    
    var firstNumber: Double = 0.0
    var secondNumber: Double = 0
    var result: Double = 0
    
    
    let numberField: UITextField = {
        let area = UITextField()
        area.backgroundColor = .white
        area.placeholder = "0"
        area.font = UIFont.boldSystemFont(ofSize: 70)
        return area
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(numberField)
        view.backgroundColor = .black
        buttons()
        label()
        
        numberField.snp.makeConstraints { maker in
            maker.height.equalToSuperview().inset(320)
            maker.top.equalToSuperview().inset(10)
            maker.left.right.equalToSuperview().inset(0)
        }
        
        
        
        func label() {
            let label = UIButton(type: .system)
            view.addSubview(label)
            label.setTitle("История", for: .normal)
            label.titleLabel?.textColor = .white
            label.snp.makeConstraints { maker in
                maker.top.equalToSuperview().inset(200)
                maker.right.equalToSuperview().inset(20)
                maker.height.width.equalTo(100)
            }
            label.addTarget(self, action: #selector(switchView), for: .touchUpInside)
            
        }
        //MARK: constraints numberField
        
        
        
        
        //MARK: Buttons
        func buttons() {
            let buttonZero = UIButton(type: .system)
            let buttonOne = UIButton(type: .system)
            let buttonTwo = UIButton(type: .system)
            let buttonThree = UIButton(type: .system)
            let buttonFour = UIButton(type: .system)
            let buttonFive = UIButton(type: .system)
            let buttonSix = UIButton(type: .system)
            let buttonSeven = UIButton(type: .system)
            let buttonEight = UIButton(type: .system)
            let buttonNine = UIButton(type: .system)
            let typeDouble = UIButton(type: .system)
            let deleteAll = UIButton(type: .system)
            let multiplication = UIButton(type: .system)
            let division = UIButton(type: .system)
            let substraction = UIButton(type: .system)
            let addition = UIButton(type: .system)
            let equal = UIButton(type: .system)
            let plusMinus = UIButton(type: .system)
            let procent = UIButton(type: .system)
            
            
            // Add to view all
            view.addSubview(buttonZero)
            view.addSubview(buttonOne)
            view.addSubview(buttonTwo)
            view.addSubview(buttonThree)
            view.addSubview(buttonFour)
            view.addSubview(buttonFive)
            view.addSubview(buttonSix)
            view.addSubview(buttonSeven)
            view.addSubview(buttonEight)
            view.addSubview(buttonNine)
            view.addSubview(typeDouble)
            view.addSubview(deleteAll)
            view.addSubview(multiplication)
            view.addSubview(division)
            view.addSubview(substraction)
            view.addSubview(addition)
            view.addSubview(equal)
            view.addSubview(plusMinus)
            view.addSubview(procent)
            // Add color all buttons
            buttonZero.backgroundColor = UIColor(red: 47/255, green: 46/255, blue: 46/255, alpha: 1)
            buttonOne.backgroundColor = UIColor(red: 47/255, green: 46/255, blue: 46/255, alpha: 1)
            buttonTwo.backgroundColor = UIColor(red: 47/255, green: 46/255, blue: 46/255, alpha: 1)
            buttonThree.backgroundColor = UIColor(red: 47/255, green: 46/255, blue: 46/255, alpha: 1)
            buttonFour.backgroundColor = UIColor(red: 47/255, green: 46/255, blue: 46/255, alpha: 1)
            buttonFour.backgroundColor = UIColor(red: 47/255, green: 46/255, blue: 46/255, alpha: 1)
            buttonFive.backgroundColor = UIColor(red: 47/255, green: 46/255, blue: 46/255, alpha: 1)
            buttonSix.backgroundColor = UIColor(red: 47/255, green: 46/255, blue: 46/255, alpha: 1)
            buttonSeven.backgroundColor = UIColor(red: 47/255, green: 46/255, blue: 46/255, alpha: 1)
            buttonEight.backgroundColor = UIColor(red: 47/255, green: 46/255, blue: 46/255, alpha: 1)
            buttonNine.backgroundColor = UIColor(red: 47/255, green: 46/255, blue: 46/255, alpha: 1)
            deleteAll.backgroundColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1)
            plusMinus.backgroundColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1)
            procent.backgroundColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1)
            division.backgroundColor = UIColor(red: 253/255, green: 159/255, blue: 7/255, alpha: 1)
            multiplication.backgroundColor = UIColor(red: 253/255, green: 159/255, blue: 7/255, alpha: 1)
            substraction.backgroundColor = UIColor(red: 253/255, green: 159/255, blue: 7/255, alpha: 1)
            addition.backgroundColor = UIColor(red: 253/255, green: 159/255, blue: 7/255, alpha: 1)
            equal.backgroundColor = UIColor(red: 253/255, green: 159/255, blue: 7/255, alpha: 1)
            typeDouble.backgroundColor = UIColor(red: 47/255, green: 46/255, blue: 46/255, alpha: 1)
            
            // Add Title Text all buttons
            buttonZero.setTitle("0            ", for: .normal)
            buttonOne.setTitle("1", for: .normal)
            buttonTwo.setTitle("2", for: .normal)
            buttonThree.setTitle("3", for: .normal)
            buttonFour.setTitle("4", for: .normal)
            buttonFive.setTitle("5", for: .normal)
            buttonSix.setTitle("6", for: .normal)
            buttonSeven.setTitle("7", for: .normal)
            buttonEight.setTitle("8", for: .normal)
            buttonNine.setTitle("9", for: .normal)
            deleteAll.setTitle("AC", for: .normal)
            plusMinus.setTitle("+/-", for: .normal)
            procent.setTitle("%", for: .normal)
            division.setTitle("/", for: .normal)
            multiplication.setTitle("X", for: .normal)
            substraction.setTitle("-", for: .normal)
            addition.setTitle("+", for: .normal)
            equal.setTitle("=", for: .normal)
            typeDouble.setTitle(",", for: .normal)
            
            
            // Add Font All buttons
            buttonZero.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            buttonOne.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            buttonTwo.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            buttonThree.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            buttonFour.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            buttonFive.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            buttonSix.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            buttonSeven.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            buttonEight.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            buttonNine.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            deleteAll.titleLabel?.font = UIFont.systemFont(ofSize: 36)
            plusMinus.titleLabel?.font = UIFont.systemFont(ofSize: 36)
            procent.titleLabel?.font = UIFont.systemFont(ofSize: 36)
            division.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            multiplication.titleLabel?.font = UIFont.boldSystemFont(ofSize: 34)
            substraction.titleLabel?.font = UIFont.systemFont(ofSize: 60)
            equal.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            typeDouble.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            addition.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            
            // Add all buttons corner raduis
            buttonZero.layer.cornerRadius = 40
            buttonOne.layer.cornerRadius = 40
            buttonTwo.layer.cornerRadius = 40
            buttonThree.layer.cornerRadius = 40
            buttonFour.layer.cornerRadius = 40
            buttonFive.layer.cornerRadius = 40
            buttonSix.layer.cornerRadius = 40
            buttonSeven.layer.cornerRadius = 40
            buttonEight.layer.cornerRadius = 40
            buttonNine.layer.cornerRadius = 40
            deleteAll.layer.cornerRadius = 40
            plusMinus.layer.cornerRadius = 40
            procent.layer.cornerRadius = 40
            division.layer.cornerRadius = 40
            multiplication.layer.cornerRadius = 40
            substraction.layer.cornerRadius = 40
            addition.layer.cornerRadius = 40
            equal.layer.cornerRadius = 40
            typeDouble.layer.cornerRadius = 40
            //Set title Color
            buttonZero.setTitleColor(.white, for: .normal)
            buttonOne.setTitleColor(.white, for: .normal)
            buttonTwo.setTitleColor(.white, for: .normal)
            buttonThree.setTitleColor(.white, for: .normal)
            buttonFour.setTitleColor(.white, for: .normal)
            buttonFive.setTitleColor(.white, for: .normal)
            buttonSix.setTitleColor(.white, for: .normal)
            buttonSeven.setTitleColor(.white, for: .normal)
            buttonEight.setTitleColor(.white, for: .normal)
            buttonNine.setTitleColor(.white, for: .normal)
            deleteAll.setTitleColor(.black, for: .normal)
            plusMinus.setTitleColor(.black, for: .normal)
            procent.setTitleColor(.black, for: .normal)
            division.setTitleColor(.white, for: .normal)
            multiplication.setTitleColor(.white, for: .normal)
            substraction.setTitleColor(.white, for: .normal)
            addition.setTitleColor(.white, for: .normal)
            equal.setTitleColor(.white, for: .normal)
            typeDouble.setTitleColor(.white, for: .normal)
            
            //MARK: first Line
            // Make zero button constraint
            buttonZero.snp.makeConstraints { maker in
                maker.height.equalTo(80)
                maker.width.equalTo(170)
                maker.left.equalToSuperview().inset(16)
                maker.bottom.equalToSuperview().inset(30)
            }
            //Make typeDouble button constraint
            typeDouble.snp.makeConstraints { maker in
                maker.width.height.equalTo(80)
                
                maker.bottom.equalToSuperview().inset(30)
                maker.left.equalTo(buttonOne).inset(180)
            }
            //Make is equal constraint
            equal.snp.makeConstraints { maker in
                maker.height.width.equalTo(80)
                maker.left.equalTo(typeDouble).inset(90)
                maker.bottom.equalToSuperview().inset(30)
            }
            
            //MARK: second Line
            //Make one button constraint
            buttonOne.snp.makeConstraints { maker in
                maker.height.width.equalTo(80)
                maker.bottom.equalTo(buttonZero).inset(100)
                maker.left.equalToSuperview().inset(16)
            }
            //Make two button constraint
            buttonTwo.snp.makeConstraints { maker in
                maker.height.width.equalTo(80)
                maker.left.equalTo(buttonOne).inset(90)
                maker.bottom.equalTo(buttonZero).inset(100)
            }
            //Make tree button constraint
            buttonThree.snp.makeConstraints{ maker in
                maker.height.width.equalTo(80)
                maker.bottom.equalTo(typeDouble).inset(100)
                maker.left.equalTo(buttonTwo).inset(90)
            }
            //Make addition button constraint
            addition.snp.makeConstraints { maker in
                maker.height.width.equalTo(80)
                maker.bottom.equalTo(equal).inset(100)
                maker.left.equalTo(buttonThree).inset(90)
            }
            
            //MARK: Third line
            buttonFour.snp.makeConstraints { maker in
                maker.height.width.equalTo(80)
                maker.bottom.equalTo(buttonOne).inset(100)
                maker.left.equalToSuperview().inset(16)
            }
            buttonFive.snp.makeConstraints { maker in
                maker.height.width.equalTo(80)
                maker.bottom.equalTo(buttonTwo).inset(100)
                maker.left.equalTo(buttonFour).inset(90)
            }
            buttonSix.snp.makeConstraints { maker in
                maker.height.width.equalTo(80)
                maker.bottom.equalTo(buttonThree).inset(100)
                maker.left.equalTo(buttonFive).inset(90)
            }
            substraction.snp.makeConstraints { maker in
                maker.height.width.equalTo(80)
                maker.bottom.equalTo(addition).inset(100)
                maker.left.equalTo(buttonSix).inset(90)
            }
            
            //MARK: Four line
            buttonSeven.snp.makeConstraints { maker in
                maker.height.width.equalTo(80)
                maker.bottom.equalTo(buttonFour).inset(100)
                maker.left.equalToSuperview().inset(16)
            }
            buttonEight.snp.makeConstraints { maker in
                maker.height.width.equalTo(80)
                maker.bottom.equalTo(buttonFive).inset(100)
                maker.left.equalTo(buttonSeven).inset(90)
            }
            buttonNine.snp.makeConstraints { maker in
                maker.height.width.equalTo(80)
                maker.bottom.equalTo(buttonSix).inset(100)
                maker.left.equalTo(buttonEight).inset(90)
            }
            multiplication.snp.makeConstraints { maker in
                maker.height.width.equalTo(80)
                maker.bottom.equalTo(buttonSix).inset(100)
                maker.left.equalTo(buttonNine).inset(90)
            }
            
            //MARK: five line
            deleteAll.snp.makeConstraints { maker in
                maker.height.width.equalTo(80)
                maker.bottom.equalTo(buttonSeven).inset(100)
                maker.left.equalToSuperview().inset(16)
            }
            plusMinus.snp.makeConstraints { maker in
                maker.height.width.equalTo(80)
                maker.bottom.equalTo(buttonSeven).inset(100)
                maker.left.equalTo(deleteAll).inset(90)
            }
            procent.snp.makeConstraints { maker in
                maker.height.width.equalTo(80)
                maker.bottom.equalTo(buttonNine).inset(100)
                maker.left.equalTo(plusMinus).inset(90)
            }
            division.snp.makeConstraints { maker in
                maker.height.width.equalTo(80)
                maker.bottom.equalTo(multiplication).inset(100)
                maker.left.equalTo(procent).inset(90)
            }
            
            buttonZero.addTarget(self, action: #selector(buttonZeroTapped), for: .touchUpInside)
            buttonOne.addTarget(self, action: #selector(buttonOneTapped), for: .touchUpInside)
            buttonTwo.addTarget(self, action: #selector(buttonTwoTapped), for: .touchUpInside)
            buttonThree.addTarget(self, action: #selector(buttonThreeTapped), for: .touchUpInside)
            buttonFour.addTarget(self, action: #selector(buttonFourTapped), for: .touchUpInside)
            buttonFive.addTarget(self, action: #selector(buttonFiveTapped), for: .touchUpInside)
            buttonSix.addTarget(self, action: #selector(buttonSixTapped), for: .touchUpInside)
            buttonSeven.addTarget(self, action: #selector(buttonSevenTapped), for: .touchUpInside)
            buttonEight.addTarget(self, action: #selector(buttonEightTapped), for: .touchUpInside)
            buttonNine.addTarget(self, action: #selector(buttonNineTapped), for: .touchUpInside)
            deleteAll.addTarget(self, action: #selector(cleaningAll), for: .touchUpInside)
            division.addTarget(self, action: #selector(divisionNumbers), for: .touchUpInside)
            procent.addTarget(self, action: #selector(procentNumbers), for: .touchUpInside)
            multiplication.addTarget(self, action: #selector(multiplyNumbers), for: .touchUpInside)
            substraction.addTarget(self, action: #selector(substractionNumbers), for: .touchUpInside)
            addition.addTarget(self, action: #selector(additionNumbers), for: .touchUpInside)
            equal.addTarget(self, action: #selector(ravno), for: .touchUpInside)
            //delete last number Change in Target!!
            plusMinus.addTarget(self, action: #selector(changePlusMinus), for: .touchUpInside)
            typeDouble.addTarget(self, action: #selector(additionPoint), for: .touchUpInside)
            
            
            
            let deleteLast = UIButton()
            deleteLast.addTarget(self, action: #selector(DeleteLastNumber), for: .editingChanged)
        }
        
    }
    
    @objc private func changePlusMinus() {
        
    }
    
    @objc private func additionPoint() {
        numberField.text?.append(".")
    }
    
    @objc private func substractionNumbers() {
        if let text = Double(numberField.text!) {
            firstNumber = text
            historyCalculate = numberField.text!.components(separatedBy: "")
            historyCalculate.append("-")
        }
        minusAction = 1
        numberField.text? = ""
        
        
    }
    
    @objc private func divisionNumbers() {
        if let text = Double(numberField.text!) {
            firstNumber = text
            historyCalculate = numberField.text!.components(separatedBy: "")
            historyCalculate.append("/")
        }
        deleteAction = 1
        numberField.text? = ""
        
    }
    @objc private func procentNumbers() {
        if let text = Double(numberField.text!) {
            firstNumber = text
            historyCalculate = numberField.text!.components(separatedBy: "")
            historyCalculate.append("%")
        }
        procentAction = 1
        numberField.text? = ""
        
    }
    @objc private func multiplyNumbers() {

        if let text = Double(numberField.text!) {
            firstNumber = text
            historyCalculate = numberField.text!.components(separatedBy: "")
            historyCalculate.append("*")
        }
        numberField.text? = ""
        multiplyAction = 1
        
    }
    
    @objc private func additionNumbers() {
        if let text = Double(numberField.text!) {
            firstNumber = text
            historyCalculate = numberField.text!.components(separatedBy: "")
            historyCalculate.append("+")
        }
        numberField.text? = ""
        plusAction = 1
    }
    
    @objc private func DeleteLastNumber() {
        numberField.text?.removeLast()
        deleteAction = 1
    }
    
    @objc private func buttonZeroTapped() {
        numberField.text?.append("0")
        //     historyCalculate.append("0")
    }
    @objc private func buttonOneTapped() {

        numberField.text?.append("1")
        
        //     historyCalculate.append("1")
    }
    @objc private func buttonTwoTapped() {
        numberField.text?.append("2")
        
        //      historyCalculate.append("2")
    }
    @objc private func buttonThreeTapped() {

        numberField.text?.append("3")
        
        //     historyCalculate.append("3")
    }
    @objc private func buttonFourTapped() {
        numberField.text?.append("4")
        //     historyCalculate.append("4")
        firstNumber = Double(numberField.text!)!
    }
    @objc private func buttonFiveTapped() {
        numberField.text?.append("5")
        //   historyCalculate.append("5")
        
    }
    @objc private func buttonSixTapped() {
        numberField.text?.append("6")
        //     historyCalculate.append("6")
        
    }
    @objc private func buttonSevenTapped() {

        numberField.text?.append("7")
        //    historyCalculate.append("7")
        
    }
    @objc private func buttonEightTapped() {
        numberField.text?.append("8")
        //     historyCalculate.append("8")
        
    }
    @objc private func buttonNineTapped() {
        numberField.text?.append("9")
        //    historyCalculate.append("9")
        
    }
    @objc private func cleaningAll() {
        numberField.text?.removeAll()
    }
    
    @objc private func ravno() {
        secondNumber = Double(numberField.text!)!
        
        print("\(firstNumber), \(secondNumber)")
        if minusAction == 1 {
            result = firstNumber - secondNumber
        } else if plusAction == 1 {
            result = firstNumber + secondNumber
        } else if multiplyAction == 1{
            result = firstNumber * secondNumber
        } else if deleteAction == 1 {
            result = firstNumber / secondNumber
        } else if procentAction == 1 {
            result = Double(Int(firstNumber) % Int(secondNumber))
        }
        
        historyCalculate.append(String(secondNumber))
        historyCalculate.append("=")
        historyCalculate.append(String(result))
        minusAction = 0
        plusAction = 0
        multiplyAction = 0
        deleteAction = 0
        procentAction = 0
        numberField.text? = "\(result)"
        print(historyCalculate)
        secondVC.history = historyCalculate.joined(separator: "")
        secondVC.historyCalculating.append(secondVC.history)
    }
    
    @objc private func switchView() {
        navigationController?.pushViewController(secondVC, animated: true)
    }
}


