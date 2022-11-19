//
//  FriendViewController.swift
//  MyPooDiary
//
//  Created by 박의서 on 2022/11/20.
//

import UIKit

import SnapKit
import Then

import Moya

final class FriendViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - UI
    private let topBar =  UIView()
    private let pooView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.layer.applySketchShadow(
            color: .black,
            alpha: 0.1,
            x: 0,
            y: 2,
            blur: 18,
            spread: 0)
    }
    private lazy var cheeringButton = UIButton().then {
        $0.backgroundColor = UIColor(hex: "0066FF", alpha: 1)
        $0.layer.cornerRadius = 14
        $0.addTarget(self, action: #selector(touchUpCheeringButton), for: .touchUpInside)
    }
    
    private lazy var backButton = makeButton("")
    private var infoLabel = UILabel().then {
        $0.text = "이길동님의 변기록이에요"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    private lazy var userProfilesImage = makeImageView("")
    private var cheeringLabel = UILabel().then {
        $0.text = "박서현님 외 12명이 응원하고 있어요!"
        $0.font = .systemFont(ofSize: 16)
    }
    private lazy var poorImageView = makeImageView("")
    private var pooTimeLabel = UILabel().then {
        $0.text = "오후 11:52"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    private let cheeringBottomLabel = UILabel().then {
        $0.text = "아직 이길동님이 변하지 않았어요. 힘주기로 응원해보세요!"
        $0.textColor = UIColor(hex: "767676", alpha: 1)
        $0.font = .systemFont(ofSize: 12)
    }
    private let cheeringButtonLabel = UILabel().then {
        $0.text = "힘주기"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    // MARK: - Functions
    
    
    
}

// MARK: - Extensions
extension FriendViewController {
    
    // MARK: - Custom Method
    
    private func setLayout() {
        view.backgroundColor = .white
        
        view.addSubviews(topBar, infoLabel, userProfilesImage, cheeringLabel, pooView, cheeringBottomLabel, cheeringButton)
        
        // MARK: - TopBar View Constraints
        topBar.addSubviews(backButton)
        topBar.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(66)
        }
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(27)
            $0.width.equalTo(25)
            $0.height.equalTo(34)
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(topBar.snp.bottom).offset(16)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        userProfilesImage.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(12)
            $0.leading.equalTo(infoLabel)
            $0.width.equalTo(38)
            $0.height.equalTo(22)
        }
        
        cheeringLabel.snp.makeConstraints {
            $0.centerY.equalTo(userProfilesImage)
            $0.leading.equalTo(userProfilesImage.snp.trailing).offset(4)
        }
        
        // MARK: - Poo View Constraints
        pooView.addSubviews(poorImageView, pooTimeLabel)
        pooView.snp.makeConstraints {
            $0.top.equalTo(cheeringLabel.snp.bottom).offset(18)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.height.equalTo(pooView.snp.width)
        }
        poorImageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.width.equalTo(40)
        }
        pooTimeLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().offset(-32)
        }
        
        cheeringBottomLabel.snp.makeConstraints {
            $0.centerX.equalTo(cheeringButton)
            $0.bottom.equalTo(cheeringButton.snp.top).inset(-14)
        }
        
        // MARK: - Cheering Button Constraints
        cheeringButton.addSubviews(cheeringButtonLabel)
        cheeringButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.height.equalTo(60)
        }
        cheeringButtonLabel.snp.makeConstraints {
            $0.centerX.centerY.equalTo(cheeringButton)
        }
        
    }
    
    private func makeButton(_ imageString: String)-> UIButton{
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: imageString), for: .normal)
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .systemGray
        return button
    }
    
    private func makeImageView(_ imageString: String)-> UIImageView {
        let imageView = UIImageView(image: UIImage(named: imageString))
        return imageView
    }
    
    // MARK: - @objc Function
    @objc
    private func touchUpCheeringButton() {
        cheeringButton.backgroundColor = UIColor(hex: "99C2FF", alpha: 1)
        cheeringButton.isUserInteractionEnabled = false
        cheeringButtonLabel.text = "힘주기 완료"
        cheeringBottomLabel.text = "힘주기를 완료했어요."
    }

}

extension CALayer {
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}

// MARK: - Network
