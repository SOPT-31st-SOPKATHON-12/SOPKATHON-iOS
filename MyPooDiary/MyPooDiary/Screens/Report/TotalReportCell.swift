//
//  TotalReportCell.swift
//  MyPooDiary
//
//  Created by 김인영 on 2022/11/30.
//

import UIKit
import SnapKit
import Then

class TotalReportCell: UITableViewCell {
    
    static let identifier = "TotalReportCell"
    
    let reportLabel1 = UILabel().then {
        $0.text = "최근 7일 내 김솝트님은"
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    let totalNum = UILabel().then {
        $0.text = "N번"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .blue
    }
    
    let reportLabel2 = UILabel().then {
        $0.text = "변했어요"
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TotalReportCell {
    
    func setLayout() {
        contentView.addSubviews(reportLabel1, totalNum, reportLabel2)
        
        reportLabel1.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        
        totalNum.snp.makeConstraints {
            $0.bottom.equalTo(reportLabel1)
            $0.leading.equalTo(reportLabel1.snp.trailing).offset(4)
        }
        
        reportLabel2.snp.makeConstraints {
            $0.leading.equalTo(totalNum.snp.trailing).offset(4)
            $0.centerY.equalTo(reportLabel1)
        }
    }
    
    func dataBind(model: TotalReportModel) {
        totalNum.text = model.num
    }
}
