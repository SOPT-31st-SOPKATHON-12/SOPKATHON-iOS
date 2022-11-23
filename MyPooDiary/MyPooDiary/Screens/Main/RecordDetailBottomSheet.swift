//
//  RecordDetailBottomSheet.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import UIKit

final class RecordDetailBottomSheet: UIViewController {
    
    // MARK: - Properties
    
    lazy var colorBtnArray = [colorButton1, colorButton2, colorButton3, colorButton4, colorButton5]
    lazy var strengthBtnArray = [strengthButton1, strengthButton2, strengthButton3]
    
    // MARK: - UI
    
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
    
    private lazy var colorButtonStack = UIStackView(arrangedSubviews: [colorButton1, colorButton2, colorButton3, colorButton4, colorButton5])
        .then {
            $0.axis = .horizontal
            $0.spacing = 25
            $0.distribution = .fillEqually
        }
    
    private lazy var strengthButtonStack = UIStackView(arrangedSubviews: [strengthButton1, strengthButton2, strengthButton3])
        .then {
            $0.axis = .horizontal
            $0.spacing = 40
            $0.distribution = .fillEqually
        }
    
    private lazy var completeButton = UIButton(type: .custom).then {
        $0.setAttributedTitle(NSAttributedString(string: "완료", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .bold), .foregroundColor: UIColor.white]), for: .normal)
        $0.backgroundColor = .myBlue.withAlphaComponent(0.5)
        $0.layer.cornerRadius = 14
        $0.isEnabled = false
        $0.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setButtonStacks()
    }
    
    // MARK: - Functions

    private func setLayout() {
        view.backgroundColor = .black.withAlphaComponent(0.5)

        view.addSubview(containerView)
        containerView.addSubviews(backButton, titleLabel, colorLabel, strengthLabel, colorButtonStack, strengthButtonStack, completeButton)
        
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
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
        
        strengthLabel.snp.makeConstraints { make in
            make.top.equalTo(colorLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(38)
        }
        
        colorButtonStack.snp.makeConstraints { make in
            make.leading.equalTo(colorLabel.snp.trailing).offset(30)
            make.trailing.equalToSuperview().inset(50)
            make.centerY.equalTo(colorLabel)
        }

        strengthButtonStack.snp.makeConstraints { make in
            make.leading.equalTo(strengthLabel.snp.trailing).offset(30)
            make.trailing.equalToSuperview().inset(50)
            make.centerY.equalTo(strengthLabel)
        }
        
        completeButton.snp.makeConstraints { make in
            make.top.equalTo(strengthLabel.snp.bottom).offset(58)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(60)
        }
    }
    
    private func setButtonStacks() {
        [colorButton1, colorButton2, colorButton3, colorButton4, colorButton5].forEach {
            $0.addTarget(self, action: #selector(colorButtonDidTap(sender: )), for: .touchUpInside)
        }
        
        [strengthButton1, strengthButton2, strengthButton3].forEach {
            $0.addTarget(self, action: #selector(strengthButtonDidTap(sender: )), for: .touchUpInside)
        }
    }
    
    // MARK: - @objc Function
    
    @objc
    private func dismissVC() {
        self.dismiss(animated: true)
    }
    
    @objc
    func colorButtonDidTap(sender: UIButton) {
        
        sender.isSelected.toggle()
        
        for btn in colorBtnArray {
            btn.isSelected = btn == sender ? true : false
            // TODO: 코드 수정
            if btn.isSelected && (strengthButton1.isSelected || strengthButton2.isSelected || strengthButton3.isSelected) {
                completeButton.backgroundColor = .myBlue
                completeButton.isSelected = true
                completeButton.isEnabled = true
            }
        }
    }
    
    @objc
    func strengthButtonDidTap(sender: UIButton) {
        
        sender.isSelected.toggle()

        for btn in strengthBtnArray {
            btn.isSelected = btn == sender ? true : false
            // TODO: 코드 수정
            if btn.isSelected && (colorButton1.isSelected || colorButton2.isSelected || colorButton3.isSelected || colorButton4.isSelected || colorButton5.isSelected) {
                completeButton.backgroundColor = .myBlue
                completeButton.isSelected = true
                completeButton.isEnabled = true
            }
        }
    }
    
    @objc
    func completeButtonDidTap() {
        
        // network
        
        let mainViewController = MainViewController()
        mainViewController.modalPresentationStyle = .fullScreen
        mainViewController.modalTransitionStyle = .crossDissolve

        
        self.showToast(message: "등록되었습니다")
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.present(mainViewController, animated: true)
        }
    }
}


