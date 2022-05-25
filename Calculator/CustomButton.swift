//
//  CustomButton.swift
//  Calculator
//
//  Created by Mert Şafaktepe on 25.05.2022.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
        }
    }
    
    
    

}
