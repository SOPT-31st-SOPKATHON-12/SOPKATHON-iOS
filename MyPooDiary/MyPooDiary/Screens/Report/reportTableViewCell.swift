//
//  reportTableViewCell.swift
//  MyPooDiary
//
//  Created by 김인영 on 2022/11/20.
//

import UIKit
import SnapKit
import Then

class reportTableViewCell: UITableViewCell {

    static let identifier = "ReportTableViewCell"
    let reportView = UIImageView()
    let reportLabel = UILabel()
    
    // MARK: - Life Cycles
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            layout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

}

extension reportTableViewCell {
    func layout() {
        contentView.addSubviews(reportView, reportLabel)
        
        reportView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(16)
        }
        
        reportLabel.snp.makeConstraints {
            $0.centerY.equalTo(reportView)
            $0.leading.equalTo(reportView.snp.trailing).offset(12)
        }
    }
    
    func dataBind(model: ReportModel) {
        reportView.image = UIImage(named: model.image)
        reportLabel.text = model.label
    }
}
