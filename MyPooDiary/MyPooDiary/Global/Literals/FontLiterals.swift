//
//  FontLiterals.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import UIKit

enum FontName: String {
    case ASDGNeoBold = "AppleSDGothicNeo-Bold"
    case ASDGNeoMedium = "AppleSDGothicNeo-Medium"
    case ASDGNeoRegular = "AppleSDGothicNeo-Regular"
    case ASDGNeoSemiBold = "AppleSDGothicNeo-SemiBold"
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}
