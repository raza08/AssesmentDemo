//
//  UIview+Extension.swift
//  AssignmentDemo

import UIKit

extension UIView {
    
    enum roundType {
        case circle
        case custom(Int)
    }
    
    func cornerRadius(type: roundType) {
        
        self.layer.masksToBounds = true
        
        switch type {
        case .circle:
            self.layer.cornerRadius = self.frame.height/2
        case .custom(let value):
            self.layer.cornerRadius = CGFloat(value)
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidths: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor.init(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

}
