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
    
    //MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()
        //clearAllLabels()
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
        
    }
    @IBAction func deleteAllButtonClicked(_ sender: Any) {
        clearAllLabels()
    }
    @IBAction func numbersButtonClicked(_ sender: UIButton) {
        print(sender.currentTitle ?? 0)
    }
    
    @IBAction func operationButtonClicked(_ sender: UIButton) {
        print(sender.currentTitle ?? "+")
    }
    
    //MARK: Functions used for button's actions.
    func clearAllLabels() {
        operationLabel.text = nil
        resultLabel.text = nil
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
