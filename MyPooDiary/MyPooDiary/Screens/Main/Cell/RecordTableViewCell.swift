//
//  RecordTableViewCell.swift
//  MyPooDiary
//
//  Created by 이승헌 on 2022/11/20.
//

import UIKit

class RecordTableViewCell: UITableViewCell {
    
    let imageWidth = UIScreen.main.bounds.width
    
    // MARK: - Identifier
    
    static let identifier = "RecordTableViewCell"
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components
    
    private let baseView: UIView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.layer.shadowRadius = 18
        $0.layer.shadowOpacity = 0.05
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    private let pooImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "dummy")
    }
    
    private let timeLabel: UILabel = UILabel().then {
        $0.text = "오후 11:52"
    }
}


extension RecordTableViewCell {
    // MARK: - UI Helpers
    private func setUI() {
        backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    // MARK: - Layout Helpers
    
    private func setLayout() {
        self.addSubviews(
            baseView,
            pooImageView,
            timeLabel
        )
        
        baseView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.width.equalTo(327)
            $0.height.equalTo(327)
            $0.centerX.equalToSuperview()
        }
        
        pooImageView.snp.makeConstraints {
            $0.edges.equalTo(baseView)
        }
        
        timeLabel.snp.makeConstraints {
            $0.bottom.equalTo(pooImageView).inset(20)
            $0.trailing.equalTo(pooImageView).inset(32)
        }
    }
    
    // MARK: - General Helpers
    
    public func dataBind(model: RecordModel) {
        pooImageView.image = UIImage(named: model.image)
        timeLabel.text = model.time
    }
}
