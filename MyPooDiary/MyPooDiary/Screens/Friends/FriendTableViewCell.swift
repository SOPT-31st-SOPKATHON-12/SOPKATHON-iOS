//
//  FriendTableViewCell.swift
//  MyPooDiary
//
//  Created by 박의서 on 2022/11/20.
//

import UIKit

import SnapKit
import Then

final class FriendTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "FriendTableViewCell"
    
    // MARK: - UI Components
    
    private let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "")
    }
    private let nameLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "라이푸"
        $0.font = .systemFont(ofSize: 16)
    }
    private let leftShiftButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "shift-right"), for: .normal)

    }
    
    // MARK: - LifeCycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - General Helpers
    
    func dataBind(model: FriendModel) {
        profileImageView.image = UIImage(named: model.friendImage)
        nameLabel.text = model.name
    }
    
    // MARK: - Custom Method
    private func setLayout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.addSubviews(profileImageView, nameLabel, leftShiftButton)
        
        profileImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(24)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(14)
        }
        
        leftShiftButton.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView)
            $0.trailing.equalToSuperview().offset(-29)
            $0.width.height.equalTo(24)
        }
    }

}
