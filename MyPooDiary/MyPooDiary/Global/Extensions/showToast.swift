//
//  showToast.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/23.
//

import UIKit

extension UIViewController {
    func showToast(message: String, yInsetFromSuperView: Int = 35) {
        Toast.show(message: message, controller: self, yInsetFromSuperView: yInsetFromSuperView)
    }
}

final class Toast {
    static func show(message: String, controller: UIViewController, yInsetFromSuperView: Int) {
        
        let toastContainer = UIView()
        let toastLabel = UILabel()
        
        toastContainer.backgroundColor = .myGray600
        toastContainer.alpha = 1
        toastContainer.layer.cornerRadius = 20
        toastContainer.clipsToBounds = true
        toastContainer.isUserInteractionEnabled = false
        
        toastLabel.textColor = .white
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        toastLabel.text = message
        toastLabel.clipsToBounds = true
        toastLabel.numberOfLines = 0
        toastLabel.sizeToFit()
        
        toastContainer.addSubview(toastLabel)
        controller.view.addSubview(toastContainer)
        
        toastContainer.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(yInsetFromSuperView)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(toastLabel.frame.width + 35)
            $0.height.equalTo(toastLabel.frame.height + 25)
        }
        
        toastLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        UIView.animate(withDuration: 0.2, delay: 1.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.4, delay: 1.0, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
}
