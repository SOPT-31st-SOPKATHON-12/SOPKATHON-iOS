//
//  FriendCollectionViewCell.swift
//  MyPooDiary
//
//  Created by 이승헌 on 2022/11/20.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
   
    static let identifier = "FriendCollectionViewCell"
    
    private let contentsView: UIView = UIView()
    
    let imageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "friend")
        $0.layer.cornerRadius = 25
    }
    
    private let nameLabel: UILabel = UILabel().then {
        $0.text = "나"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FriendCollectionViewCell {
    private func setLayout() {
        backgroundColor = .clear
        self.addSubview(contentsView)
        
        contentsView.addSubviews(imageView, nameLabel)
        
        contentsView.snp.makeConstraints {
            $0.width.equalTo(60)
            $0.height.equalTo(70)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).inset(-6)
            $0.centerX.equalToSuperview()
        }
    }
    
    public func dataBind(model: FriendModel) {
        imageView.image = UIImage(named: "friend")
        nameLabel.text = model.name
    }
}
