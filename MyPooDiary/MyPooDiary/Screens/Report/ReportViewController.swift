//
//  ReportViewController.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import UIKit

import SnapKit
import Then

import Moya

final class ReportViewController: UIViewController {

    // MARK: - Properties
    static var pooNumber : Int = 0
    var sectionName : [String] = ["총 배변 횟수", "만족도", "변의 무르기", "변의 색"]
    
    // MARK: - UI
    
    private let naviView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private lazy var reportTableView = UITableView(frame: CGRect.zero, style: .grouped).then {
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.delegate = self
        $0.dataSource = self
    }
    private let backButton = UIButton().then {
        $0.setImage(UIImage(named: "back_left"), for: .normal)
    }
    private let reportLabel = UILabel().then {
        $0.text = "최근 7일 내 배변일지"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
        register()
    }
    
    // MARK: - Functions
    
    
    // MARK: - @objc Function
    @objc
    private func touchUpBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Extensions

extension ReportViewController {
    func setLayout() {
        
        view.addSubviews(
            naviView,
            reportTableView
        )
        
        naviView.addSubviews(backButton, reportLabel)
        
        naviView.snp.makeConstraints {
            $0.top.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(66)
        }
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(28)
            $0.centerY.equalToSuperview()
        }
        reportLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        reportTableView.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.bottom.equalToSuperview().inset(22)
        }
    }
    private func register() {
        reportTableView.register(ReportTableViewCell.self,
                                 forCellReuseIdentifier: ReportTableViewCell.identifier
        )
        reportTableView.register(TotalReportCell.self, forCellReuseIdentifier: TotalReportCell.identifier)
    }
    
}

extension ReportViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        case 1 :
            return 2
        case 2:
            return 3
        case 3:
            return 5
        default:
            return 0
        }
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return headerContainerView
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionName[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: TotalReportCell.identifier, for: indexPath) as! TotalReportCell
            cell.dataBind(model: dummy0[indexPath.row])
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReportTableViewCell.identifier, for: indexPath) as! ReportTableViewCell
            cell.dataBind(model: dummy1[indexPath.row])
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReportTableViewCell.identifier, for: indexPath) as! ReportTableViewCell
            cell.dataBind(model: dummy2[indexPath.row])
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReportTableViewCell.identifier, for: indexPath) as! ReportTableViewCell
            cell.dataBind(model: dummy3[indexPath.row])
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReportTableViewCell.identifier, for: indexPath) as! ReportTableViewCell
            cell.dataBind(model: dummy1[indexPath.row])
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension ReportViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
}

// MARK: -
    
    


// MARK: - Network

