//
//  ViewController.swift
//  Calculator
//
//  Created by Mert Şafaktepe on 25.05.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: OUTLETS
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var buttonsContainer: UIView!
    
    //MARK: Variables
    
    var currentOperations: String  = ""
    
    
    //MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAllLabels()
        buttonsContainer.layer.cornerRadius = 35
        buttonStackView.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        buttonStackView.isLayoutMarginsRelativeArrangement = true
  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
  
    //MARK: Actions
    
    
    @IBAction func deleteLastButtonClicked(_ sender: Any) {
        if(!currentOperations.isEmpty){
            currentOperations.removeLast()
            operationLabel.text = currentOperations
        }
    }
    @IBAction func deleteAllButtonClicked(_ sender: Any) {
        clearAllLabels()
    }
    
    @IBAction func numbersButtonClicked(_ sender: UIButton) {
      //  print(sender.currentTitle ?? 0)
        addToCurrentOperations(value: sender.currentTitle ?? "2")
    }
    
    func addToCurrentOperations(value: String) {
        currentOperations = currentOperations + value
        operationLabel.text = currentOperations
    }
    
    @IBAction func operationButtonTapped(_ sender: UIButton) {
        //print(sender.currentTitle ?? "+")
        addToCurrentOperations(value: sender.currentTitle!)

    }
    @IBAction func equalsTapped(_ sender: Any) {
        let expression = NSExpression(format: currentOperations)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultAsString = formatResult(result: result)
        operationLabel.text = resultAsString
        
    }
    
    
    
    func formatResult(result: Double) -> String
        {
            if(result.truncatingRemainder(dividingBy: 1) == 0)
            {
                return String(format: "%.0f", result)
            }
            else
            {
                return String(format: "%.2f", result)
            }
        }
    
    //MARK: Functions used for buttons.
    func clearAllLabels() {
        operationLabel.text = nil
        resultLabel.text = nil
        currentOperations = ""
    }
    
}

    //MARK: Extensions etc.
extension UIView {

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: .init(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }

}
