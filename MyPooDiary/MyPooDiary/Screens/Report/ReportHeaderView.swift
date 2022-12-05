//
//  ReportHeaderView.swift
//  MyPooDiary
//
//  Created by 김인영 on 2022/11/30.
//

import UIKit
import SnapKit
import Then

class ReportHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "ReportHeaderView"
    
    private let headerLabel = UILabel()
    private let headerView = UIView()
    private let totalPooNumLabel1 = UILabel()
    private let totalPooNum = UILabel()
    private let totalPooNumLabel2 = UILabel()
    
    //MARK: - Life Cycle
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
           
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ReportHeaderView {
    
    private func setLayout() {
        contentView.addSubviews(headerLabel, headerView, totalPooNumLabel1, totalPooNum, totalPooNumLabel2)
        
        headerLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(40)
        }
        headerView.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(64)
        }
        totalPooNumLabel1.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.leading.equalToSuperview().offset(16)
        }
        totalPooNum.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(totalPooNumLabel1.snp.trailing).offset(4)
        }
        totalPooNumLabel1.snp.makeConstraints {
            $0.top.equalTo(totalPooNumLabel1)
            $0.leading.equalTo(totalPooNum.snp.trailing).offset(4)
        }
    }
}
