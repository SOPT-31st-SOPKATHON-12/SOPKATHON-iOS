//
//  ColorLiterals.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import UIKit

extension UIColor {
    
    static var myBlack: UIColor {
        return UIColor(hex: "#151515")
    }
    
    static var myBlue: UIColor {
        return UIColor(hex: "#0066FF")
    }
    
    static var myOrange: UIColor {
        return UIColor(hex: "#EE7200")
    }
    
    static var myGray300: UIColor {
        return UIColor(hex: "#E3E3E3")
    }
    
    static var myGray600: UIColor {
        return UIColor(hex: "#B4B4B4")
    }
    
    static var myGray800: UIColor {
        return UIColor(hex: "#767676")
    }
    
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
