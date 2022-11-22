//
//  FontLiterals.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import UIKit

enum FontName: String {
    case ASDGNeoBold = "AppleSDGothicNeoB"
    case ASDGNeoMedium = "AppleSDGothicNeoM"
    case ASDGNeoRegular = "AppleSDGothicNeoR"
    case ASDGNeoSemiBold = "AppleSDGothicNeoSB"
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}
