//
//  getClassName.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import UIKit

extension NSObject {
    
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
    var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}
