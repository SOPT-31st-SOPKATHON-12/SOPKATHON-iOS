//
//  RecordDetailBottomSheet.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import UIKit

final class RecordDetailBottomSheet: UIViewController {
    
    private let containerView = UIView().then {
        $0.layer.cornerRadius = 30
    }
    
    private lazy var backButton = UIButton(type: .system).then {
        $0.setImage(UIImage(named: "Expand_left")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "왜 불만족했나요?"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    }
    
    private lazy var colorLabel = UILabel().then {
        $0.text = "색깔"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    private lazy var strengthLabel = UILabel().then {
        $0.text = "강도"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    private lazy var colorButton1 = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "color1")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.setImage(UIImage(named: "color1-click")?.withRenderingMode(.alwaysOriginal), for: .selected)
    }
    
    private lazy var colorButton2 = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "color2")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.setImage(UIImage(named: "color2-click")?.withRenderingMode(.alwaysOriginal), for: .selected)    }
    
    private lazy var colorButton3 = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "color3")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.setImage(UIImage(named: "color3-click")?.withRenderingMode(.alwaysOriginal), for: .selected)    }
    
    private lazy var colorButton4 = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "color4")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.setImage(UIImage(named: "color4-click")?.withRenderingMode(.alwaysOriginal), for: .selected)    }
    
    private lazy var colorButton5 = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "color5")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.setImage(UIImage(named: "color5-click")?.withRenderingMode(.alwaysOriginal), for: .selected)    }
    
    private lazy var strengthButton1 = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "mdi_smiley-dead")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.setImage(UIImage(named: "mdi_smiley-dead-click")?.withRenderingMode(.alwaysOriginal), for: .selected)
    }
    
    private lazy var strengthButton2 = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "mdi_smiley-happy")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.setImage(UIImage(named: "mdi_smiley-happy-click")?.withRenderingMode(.alwaysOriginal), for: .selected)
    }
    
    private lazy var strengthButton3 = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "mdi_smiley-sad")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.setImage(UIImage(named: "mdi_smiley-sad-click")?.withRenderingMode(.alwaysOriginal), for: .selected)
    }
    
    
    private lazy var completeButton = UIButton(type: .system).then {
        $0.setAttributedTitle(NSAttributedString(string: "완료", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .bold), .foregroundColor: UIColor.white]), for: .normal)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 14
        $0.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        [colorButton1, colorButton2, colorButton3, colorButton4, colorButton5,
         strengthButton1, strengthButton2, strengthButton3].forEach {
            $0.addTarget(self, action: #selector(buttonDidTap(sender: )), for: .touchUpInside)
            $0.layer.cornerRadius = 12
        }
        
    }
    
    private func setLayout() {
        view.addSubview(containerView)
        containerView.addSubviews(backButton, titleLabel, colorLabel, strengthLabel)
        containerView.addSubviews(colorButton1, colorButton2, colorButton3, colorButton4, colorButton5)
        containerView.addSubviews(strengthButton1, strengthButton2, strengthButton3, completeButton)
        
        containerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(320)
        }
        
        containerView.backgroundColor = .white
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.centerY.equalTo(titleLabel)
        }
        
        colorLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(42)
            make.leading.equalToSuperview().offset(38)
        }
        
        colorButton1.snp.makeConstraints { make in
            make.leading.equalTo(colorLabel.snp.trailing).offset(30)
            make.centerY.equalTo(colorLabel)
            make.width.height.equalTo(24)
        }
        
        colorButton2.snp.makeConstraints { make in
            make.leading.equalTo(colorButton1.snp.trailing).offset(30)
            make.centerY.equalTo(colorLabel)
            make.width.height.equalTo(24)
        }
        
        colorButton3.snp.makeConstraints { make in
            make.leading.equalTo(colorButton2.snp.trailing).offset(30)
            make.centerY.equalTo(colorLabel)
            make.width.height.equalTo(24)
        }
        colorButton4.snp.makeConstraints { make in
            make.leading.equalTo(colorButton3.snp.trailing).offset(30)
            make.centerY.equalTo(colorLabel)
            make.width.height.equalTo(24)
        }
        
        colorButton5.snp.makeConstraints { make in
            make.leading.equalTo(colorButton4.snp.trailing).offset(30)
            make.centerY.equalTo(colorLabel)
            make.width.height.equalTo(24)
        }
        
        strengthLabel.snp.makeConstraints { make in
            make.leading.equalTo(colorLabel)
            make.top.equalTo(colorLabel.snp.bottom).offset(50)
        }
        
        strengthButton1.snp.makeConstraints { make in
            make.leading.equalTo(strengthLabel.snp.trailing).offset(52)
            make.centerY.equalTo(strengthLabel)
            make.width.equalTo(34)
            make.height.equalTo(58)

        }
        
        strengthButton2.snp.makeConstraints { make in
            make.leading.equalTo(strengthButton1.snp.trailing).offset(40)
            make.centerY.equalTo(strengthLabel)
            make.width.equalTo(34)
            make.height.equalTo(58)
        }
        
        strengthButton3.snp.makeConstraints { make in
            make.leading.equalTo(strengthButton2.snp.trailing).offset(40)
            make.centerY.equalTo(strengthLabel)
            make.width.equalTo(34)
            make.height.equalTo(58)
        }
        
        completeButton.snp.makeConstraints { make in
            make.top.equalTo(strengthLabel.snp.bottom).offset(58)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(60)
        }
    }
    
    @objc
    private func dismissVC() {
        self.dismiss(animated: true)
    }
    
    @objc func buttonDidTap(sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    @objc func completeButtonDidTap() {
        // network
        print("completeButtonDidTap")
    }
}


