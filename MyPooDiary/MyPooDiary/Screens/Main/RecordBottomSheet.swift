//
//  RecordBottomSheet.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import UIKit

import SnapKit
import Then

final class RecordBottomSheet: UIViewController {
    
    // MARK: - Properties
    
    var likesBtnArray = [UIButton]()

    // MARK: - UI

    private let containerView = UIView().then {
        $0.layer.cornerRadius = 30
    }
    
    private let titleLabel = UILabel().then {
        let attributedString = NSMutableAttributedString(string: "변", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .bold)])
        attributedString.append(NSAttributedString(string: "했나요?",
                                                   attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .regular)]))
        $0.attributedText = attributedString
    }
    
    private lazy var likeButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "bxs_like")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.setImage(UIImage(named: "bxs_like-click")?.withRenderingMode(.alwaysOriginal), for: .selected)
    }
    
    private lazy var likeLabel = UILabel().then {
        $0.text = "네, 만족해요"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }
    
    private lazy var dislikeButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "bxs_dislike")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.setImage(UIImage(named: "bxs_dislike-click")?.withRenderingMode(.alwaysOriginal), for: .selected)
    }
    
    private lazy var dislikeLabel = UILabel().then {
        $0.text = "아니요, 불만족해요"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }
    
    private lazy var likesButtonStack = UIStackView(arrangedSubviews: [likeButton, dislikeButton]).then {
        $0.axis = .horizontal
        $0.spacing = 110
        $0.distribution = .fillEqually
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
        containerView.addSubviews(titleLabel, likesButtonStack, likeLabel, dislikeLabel)
        
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
        
        likesButtonStack.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(70)
            make.leading.trailing.equalToSuperview().inset(70)
        }
        
        likeLabel.snp.makeConstraints { make in
            make.top.equalTo(likeButton.snp.bottom).offset(30)
            make.centerX.equalTo(likeButton)
        }
        
        dislikeLabel.snp.makeConstraints { make in
            make.top.equalTo(dislikeButton.snp.bottom).offset(30)
            make.centerX.equalTo(dislikeButton)
        }
        
    }
    
    private func setButtonStacks() {
        [likeButton, dislikeButton].forEach {
            $0.addTarget(self, action: #selector(likesButtonDidTap), for: .touchUpInside)
        }
    }
    
    // MARK: - @objc Function
    
    @objc
    func likesButtonDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if sender == likeButton {
            likeButton.isSelected = true
            dislikeButton.isSelected = false
            
            let mainViewController = MainViewController()
            mainViewController.modalPresentationStyle = .fullScreen
            mainViewController.modalTransitionStyle = .crossDissolve

            self.showToast(message: "등록되었습니다")
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                self.present(mainViewController, animated: true)
            }
        } else {
            likeButton.isSelected = false
            dislikeButton.isSelected = true
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                
                let detailVC = RecordDetailBottomSheet()
                detailVC.modalPresentationStyle = .fullScreen
                detailVC.modalTransitionStyle = .crossDissolve
                self.present(detailVC, animated: true, completion: nil)
            }
        }
    }
}
