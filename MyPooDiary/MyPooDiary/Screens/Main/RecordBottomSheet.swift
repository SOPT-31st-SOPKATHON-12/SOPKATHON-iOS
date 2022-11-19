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
        $0.addTarget(self, action: #selector(likeButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var likeLabel = UILabel().then {
        $0.text = "네, 만족해요"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }
    
    private lazy var dislikeButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "bxs_dislike")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.setImage(UIImage(named: "bxs_dislike-click")?.withRenderingMode(.alwaysOriginal), for: .selected)
        $0.addTarget(self, action: #selector(dislikeButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var dislikeLabel = UILabel().then {
        $0.text = "아니요, 불만족해요"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        view.backgroundColor = UIColor(hex: "767676")
    }
    
    private func setLayout() {
        view.addSubview(containerView)
        containerView.addSubviews(titleLabel, likeButton, likeLabel, dislikeButton, dislikeLabel)
        
        containerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(320)
        }
        
        containerView.backgroundColor = .white
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(80)
            make.leading.equalToSuperview().offset(80)
            make.width.height.equalTo(50)
        }
        
        likeLabel.snp.makeConstraints { make in
            make.top.equalTo(likeButton.snp.bottom).offset(30)
            make.centerX.equalTo(likeButton)
        }
        
        dislikeButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(80)
            make.trailing.equalToSuperview().inset(80)
            make.width.height.equalTo(50)
        }
        
        dislikeLabel.snp.makeConstraints { make in
            make.top.equalTo(dislikeButton.snp.bottom).offset(30)
            make.centerX.equalTo(dislikeButton)
        }
        

    }
    
    @objc
    func likeButtonDidTap(_ sender: Any) {
        likeButton.isSelected.toggle()
        likeButton.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            //network
            self.dismiss(animated: true)
        }
    }
    
    @objc
    func dislikeButtonDidTap(_ sender: Any) {

        self.dislikeButton.isSelected.toggle()
        self.dislikeButton.isUserInteractionEnabled = false

        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {

            let detailVC = RecordDetailBottomSheet()
            detailVC.modalPresentationStyle = .fullScreen
            self.present(detailVC, animated: true, completion: nil)
        }
    }
}
