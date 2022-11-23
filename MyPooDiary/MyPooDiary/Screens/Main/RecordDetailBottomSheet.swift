//
//  RecordDetailBottomSheet.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import UIKit

import Moya

final class RecordDetailBottomSheet: UIViewController {
    
    // MARK: - Properties
    let recordProvider = MoyaProvider<RecordRouter>(
    plugins: [NetworkLoggerPlugin(verbose: true)])
    
    lazy var colorBtnArray = [colorButton1, colorButton2, colorButton3, colorButton4, colorButton5]
    lazy var strengthBtnArray = [strengthButton1, strengthButton2, strengthButton3]
    
    private var selectedColor: Int = 0
    private var selectedStrength: Int = 0
    
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
        $0.textColor = .myBlack
        $0.font = UIFont.font(.ASDGNeoRegular, ofSize: 18)
    }
    
    private lazy var colorLabel = UILabel().then {
        $0.text = "색깔"
        $0.textColor = .myBlack
        $0.font = UIFont.font(.ASDGNeoBold, ofSize: 14)
    }
    
    private lazy var strengthLabel = UILabel().then {
        $0.text = "강도"
        $0.textColor = .myBlack
        $0.font = UIFont.font(.ASDGNeoBold, ofSize: 14)
    }
    
    private lazy var colorButton1 = UIButton(type: .custom)
    private lazy var colorButton2 = UIButton(type: .custom)
    private lazy var colorButton3 = UIButton(type: .custom)
    private lazy var colorButton4 = UIButton(type: .custom)
    private lazy var colorButton5 = UIButton(type: .custom)
    
    private lazy var strengthButton1 = UIButton(type: .custom)
    private lazy var strengthButton2 = UIButton(type: .custom)
    private lazy var strengthButton3 = UIButton(type: .custom)
    
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
        $0.setAttributedTitle(NSAttributedString(string: "완료", attributes: [.font: UIFont.font(.ASDGNeoBold, ofSize: 16), .foregroundColor: UIColor.white]), for: .normal)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first,
           touch.view == self.view {
            hideBottomSheetWithAnimation()
        }
    }

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
        
        colorBtnArray.enumerated().forEach { (index, item) in
            item.tag = index + 1
        }
        
        strengthBtnArray.enumerated().forEach { (index, item) in
            item.tag = index + 1
        }
        
        [colorButton1, colorButton2, colorButton3, colorButton4, colorButton5].forEach {
            $0.addTarget(self, action: #selector(colorButtonDidTap(sender: )), for: .touchUpInside)
            $0.setImage(UIImage(named: "color\($0.tag)")?.withRenderingMode(.alwaysOriginal), for: .normal)
            $0.setImage(UIImage(named: "color\($0.tag)-click")?.withRenderingMode(.alwaysOriginal), for: .selected)
        }
        
        [strengthButton1, strengthButton2, strengthButton3].forEach {
            $0.addTarget(self, action: #selector(strengthButtonDidTap(sender: )), for: .touchUpInside)
            $0.setImage(UIImage(named: "mdi_smiley-\($0.tag)")?.withRenderingMode(.alwaysOriginal), for: .normal)
            $0.setImage(UIImage(named: "mdi_smiley-\($0.tag)-click")?.withRenderingMode(.alwaysOriginal), for: .selected)
        }
    }
    
    private func hideBottomSheetWithAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.containerView.snp.updateConstraints { make in
                make.height.equalTo(0)
            }
            self.view.layoutIfNeeded()
        } completion: { _ in
            let mainViewController = MainViewController()
            mainViewController.modalPresentationStyle = .fullScreen
            mainViewController.modalTransitionStyle = .crossDissolve
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                self.present(mainViewController, animated: true)
            }
        }
    }
    
    private func checkCompleteButtonState() {
        completeButton.isEnabled = (selectedColor != 0 && selectedStrength != 0)
        completeButton.backgroundColor = completeButton.isEnabled ? .myBlue : .myBlue.withAlphaComponent(0.5)
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
            if btn.isSelected {
                selectedColor = sender.tag
            }
        }
        checkCompleteButtonState()
    }
    
    @objc
    func strengthButtonDidTap(sender: UIButton) {
        sender.isSelected.toggle()
        for btn in strengthBtnArray {
            btn.isSelected = btn == sender ? true : false
            if btn.isSelected {
                selectedStrength = sender.tag
            }
        }
        checkCompleteButtonState()
    }
    
    @objc
    func completeButtonDidTap() {
        let requstDto = RecordRequestDto(1, false, color: selectedColor, strength: selectedStrength)
        fetchRecordAPI(param: requstDto)
    }
}

// MARK: - Network

extension RecordDetailBottomSheet {
    
    func fetchRecordAPI(param: RecordRequestDto){
        recordProvider.request(.fetchRecord(param: param)) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                if status >= 200 && status < 300 {
                    self.showToast(message: "마이푸가 등록되었어요")
                    
                    let mainViewController = MainViewController()
                    mainViewController.modalPresentationStyle = .fullScreen
                    mainViewController.modalTransitionStyle = .crossDissolve
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                        self.present(mainViewController, animated: true)
                    }
                } else if status >= 400 {
                    self.showToast(message: "네트워크 오류가 발생했어요. 다시 시도해 주세요.")
                    print("400 error")                    
                }
            case .failure(let error):
                self.showToast(message: "네트워크 오류가 발생했어요. 다시 시도해 주세요.")
                print(error.localizedDescription)
            }
        }
    }
}
