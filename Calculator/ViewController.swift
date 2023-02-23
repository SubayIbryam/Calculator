import UIKit

enum Operation: String {
    case Add = "+"
    case Substract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation: Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
    }
    
    
    @IBAction func numberPassedButton(_ sender: RoundButton) {
        if runningNumber.count <= 18 {
            runningNumber += "\(sender.tag)"
            resultLabel.text = runningNumber
        }
    }
    

    @IBAction func clearButton(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        resultLabel.text = "0"
    }
    
    @IBAction func dotButton(_ sender: RoundButton) {
        if runningNumber.count <= 17 {
            runningNumber += "."
            resultLabel.text = runningNumber
        }
    }
    @IBAction func equalButton(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    @IBAction func plusButton(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    @IBAction func minusButton(_ sender: RoundButton) {
        operation(operation: .Substract)
    }
    @IBAction func multiplyButton(_ sender: RoundButton) {
        operation(operation: .Multiply)
    }
    @IBAction func divideButton(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    @IBAction func percentButton(_ sender: RoundButton) {
        var firstNumber = Double(resultLabel.text!)
        firstNumber = firstNumber! / 100.0
        resultLabel.text = String(firstNumber!)
    }
    
    @IBAction func plusMinusButton(_ sender: RoundButton) {
        resultLabel.text = "-" + runningNumber
    }
    func operation(operation: Operation) {
        if currentOperation != .NULL {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                } else if currentOperation == .Substract{
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                } else if currentOperation == .Multiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                } else if currentOperation == .Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Double(result)!))"
                }
                resultLabel.text = result
            }
            currentOperation = operation
            
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

