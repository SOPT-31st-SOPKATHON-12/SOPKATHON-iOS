//
//  addSubviews.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
