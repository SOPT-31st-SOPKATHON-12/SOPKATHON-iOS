//
//  ImageLiterals.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import UIKit

enum ImageLiterals {
    
    struct Images {
        
        static var defaultImg: UIImage { .load(named: "img_defalt") }
        
        static var goodImg: UIImage { .load(named: "img_good") }
        static var goodNobkImg: UIImage { .load(named: "img_good_nobk") }
        
        static var hardBlackNobkImg: UIImage { .load(named: "img_hard_black_nobk") }
        static var hardBlackImg: UIImage { .load(named: "img_hard_black") }
        static var hardBrownNobkImg: UIImage { .load(named: "img_hard_brown_nobk") }
        static var hardBrownImg: UIImage { .load(named: "img_hard_brown") }
        static var hardGreenNobkImg: UIImage { .load(named: "img_hard_green_nobk") }
        static var hardGreenImg: UIImage { .load(named: "img_green_brown") }
        static var hardRedNobkImg: UIImage { .load(named: "img_hard_red_nobk") }
        static var hardRedImg: UIImage { .load(named: "img_hard_red") }
        static var hardYellowNobkImg: UIImage { .load(named: "img_hard_yellow_nobk") }
        static var hardYellowImg: UIImage { .load(named: "img_hard_yellow") }
        
        static var regularBlackNobkImg: UIImage { .load(named: "img_regular_black_nobk") }
        static var regularBlackImg: UIImage { .load(named: "img_regular_black") }
        static var regularBrownNobkImg: UIImage { .load(named: "img_regular_brown_nobk") }
        static var regularBrownImg: UIImage { .load(named: "img_regular_brown") }
        static var regularGreenNobkImg: UIImage { .load(named: "img_regular_green_nobk") }
        static var regularGreenImg: UIImage { .load(named: "img_regular_brown") }
        static var regularRedNobkImg: UIImage { .load(named: "img_regular_red_nobk") }
        static var regularRedImg: UIImage { .load(named: "img_regular_red") }
        static var regularYellowNobkImg: UIImage { .load(named: "img_regular_yellow_nobk") }
        static var regularYellowImg: UIImage { .load(named: "img_regular_yellow") }
        
        static var softBlackNobkImg: UIImage { .load(named: "img_soft_black_nobk") }
        static var softBlackImg: UIImage { .load(named: "img_soft_black") }
        static var softBrownNobkImg: UIImage { .load(named: "img_soft_brown_nobk") }
        static var softBrownImg: UIImage { .load(named: "img_soft_brown") }
        static var softGreenNobkImg: UIImage { .load(named: "img_soft_green_nobk") }
        static var softGreenImg: UIImage { .load(named: "img_soft_brown") }
        static var softRedNobkImg: UIImage { .load(named: "img_soft_red_nobk") }
        static var softRedImg: UIImage { .load(named: "img_soft_red") }
        static var softYellowNobkImg: UIImage { .load(named: "img_soft_yellow_nobk") }
        static var softYellowImg: UIImage { .load(named: "img_soft_yellow") }
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
