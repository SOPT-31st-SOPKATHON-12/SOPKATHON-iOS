//
//  reportTableViewCell.swift
//  MyPooDiary
//
//  Created by 김인영 on 2022/11/20.
//

import UIKit
import SnapKit
import Then

class ReportTableViewCell: UITableViewCell {

    static let identifier = "ReportTableViewCell"
    let reportView = UIImageView()
    let reportLabel = UILabel()
    
    // MARK: - Life Cycles
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setLayout()
            self.selectionStyle = .none
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

}

extension ReportTableViewCell {
    
    func setLayout() {
        contentView.addSubviews(reportView, reportLabel)
        
        reportView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(40)
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

