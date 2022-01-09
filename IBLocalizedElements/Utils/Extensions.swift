//
//  Extensions.swift
//  IBLocalizedElements
//
//  Created by Miguel on 09/01/2022.
//

import UIKit

// MARK: - String localization

extension String {
    
    var localized: String {
        return NSLocalizedString(
            self,
            tableName: nil,
            bundle: Bundle.main,
            value: "",
            comment: "")
    }
}

// MARK: - Load from Nib

public extension UIView {
    
    class func fromNib(nibNameOrNil: String? = nil) -> Self {
        return fromNib(nibNameOrNil: nibNameOrNil, type: self)
    }
    
    class func fromNib<T : UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T {
        let v: T? = fromNib(nibNameOrNil: nibNameOrNil, type: T.self)
        return v!
    }
    
    class func fromNib<T : UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T? {
        
        var view: T?
        let name: String
        
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            name = nibName
        }
        
        let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        
        for v in nibViews! {
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }
    
    class var nibName: String {
        return "\(self)".components(separatedBy: ".").first ?? ""
    }
    
    class var nib: UINib? {
        
        if let _ = Bundle.main.path(forResource: nibName, ofType: "nib") {
            return UINib(nibName: nibName, bundle: nil)
        } else {
            return nil
        }
    }
}

// MARK: - Add corner radius, borderWidth and border color

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

// MARK: - Translated text to label

extension UILabel {
    
    @IBInspectable var translatedText: String {
        get {
            return self.text ?? ""
        }
        set {
            text = newValue.localized
        }
    }
}

// MARK: - Translated text to button

extension UIButton {
    
    @IBInspectable var translatedText: String {
        get {
            return self.titleLabel?.text ?? ""
        }
        set {
            self.setTitle(newValue.localized, for: .normal)
        }
    }
}
