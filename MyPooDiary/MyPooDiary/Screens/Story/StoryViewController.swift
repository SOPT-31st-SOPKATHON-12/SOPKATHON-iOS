//
//  StoryViewController.swift
//  MyPooDiary
//
//  Created by 박의서 on 2022/11/20.
//


import UIKit

import SnapKit
import Then

import Moya

final class StoryViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - UI
    private let topBar =  UIView()
    private lazy var cheeringButton = UIButton().then {
        $0.backgroundColor = UIColor(hex: "0066FF", alpha: 1)
        $0.layer.cornerRadius = 14
        $0.addTarget(self, action: #selector(touchUpCheeringButton), for: .touchUpInside)
    }
    
    private lazy var backButton = makeButton("white-back-button").then {
        $0.addTarget(self, action: #selector(touchUpBackButton), for: .touchUpInside)
    }
    private var didPooLabel = UILabel().then {
        $0.text = "박지수님이 변했어요"
        $0.font = .systemFont(ofSize: 22, weight: .bold)
        $0.textColor = .white
    }
    private lazy var poorImageView = makeImageView("img_hard_red")
    private let cheeringBottomLabel = UILabel().then {
        $0.text = "아직 이길동님이 변하지 않았어요. 힘주기로 응원해보세요!"
        $0.textColor = UIColor(hex: "FFFFFF", alpha: 1)
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
extension StoryViewController {
    
    // MARK: - Custom Method
    
    private func setLayout() {
        view.backgroundColor = UIColor(hex: "767676", alpha: 1)
        
        view.addSubviews(topBar, poorImageView, didPooLabel, cheeringBottomLabel, cheeringButton)
        
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
        
        // MARK: - Poo View Constraints
        poorImageView.snp.makeConstraints {
            $0.top.equalTo(topBar.snp.bottom).offset(78)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(52)
            $0.height.equalTo(poorImageView.snp.width)
        }
        didPooLabel.snp.makeConstraints {
            $0.top.equalTo(poorImageView.snp.bottom).offset(68)
            $0.centerX.equalToSuperview()
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
    
    
    @objc
    private func touchUpBackButton() {
        self.dismiss(animated: true, completion: nil)
    }

}

// MARK: - Network
