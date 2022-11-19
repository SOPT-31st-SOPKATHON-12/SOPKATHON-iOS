//
//  ImageLiterals.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import UIKit

enum ImageLiterals {
    
    struct Images {
        static var sampleImg: UIImage { .load(named: "sampleImg") }
        
    }
    
    struct Icons {
        static var sampleIcn: UIImage { .load(named: "ic_sample") }
        
    }
}

extension UIImage {
    static func load(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = imageName
        return image
    }
    
    func resize(to size: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        return image
    }
}
