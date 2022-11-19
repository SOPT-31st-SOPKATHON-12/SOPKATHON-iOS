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
    var sectionName : [String] = ["만족도", "변의 무르기", "변의 색"]
    
    // MARK: - UI
    
    private let naviView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let headerContainerView = UIView()
    private let headerLabel = UILabel().then {
        $0.text = "총 배변 횟수"
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    private let headerView = UIView().then {
        $0.layer.cornerRadius = 16
        $0.backgroundColor = .blue
    }
    private let totalPooNumLabel1 = UILabel().then {
        $0.text = "최근 7일 내 김솝트님은"
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    private let totalPooNum = UILabel().then {
        $0.text = "\(pooNumber)번"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    private let totalPooNumLabel2 = UILabel().then {
        $0.text = "변했어요"
        $0.font = .systemFont(ofSize: 16, weight: .regular)
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
    
}

// MARK: - Extensions

extension ReportViewController {
    func setLayout() {
        
        view.addSubviews(
            naviView,
            reportTableView
        )
        
        naviView.addSubviews(backButton, reportLabel)
//        headerContainerView.addSubviews(headerLabel, headerView)
//        headerView.addSubviews(totalPooNumLabel1, totalPooNum, totalPooNumLabel2)
//
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
        
//        headerContainerView.snp.makeConstraints {
//            $0.top.equalTo(naviView.snp.bottom)
//            $0.leading.trailing.equalToSuperview()
//            $0.height.equalTo(68)
//        }
//        
//        headerLabel.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(40)
//        }
//        headerView.snp.makeConstraints {
//            $0.top.equalTo(headerLabel.snp.bottom).offset(8)
//            $0.leading.trailing.equalToSuperview().inset(24)
//            $0.height.equalTo(64)
//        }
//        totalPooNumLabel1.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(25)
//            $0.leading.equalToSuperview().offset(16)
//        }
//        totalPooNum.snp.makeConstraints {
//            $0.centerY.equalToSuperview()
//            $0.leading.equalTo(totalPooNumLabel1.snp.trailing).offset(4)
//        }
//        totalPooNumLabel1.snp.makeConstraints {
//            $0.top.equalTo(totalPooNumLabel1)
//            $0.leading.equalTo(totalPooNum.snp.trailing).offset(4)
//        }
        
        
        reportTableView.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.bottom.equalToSuperview().inset(22)
        }
    }
    private func register() {
            reportTableView.register(reportTableViewCell.self,
                                    forCellReuseIdentifier: reportTableViewCell.identifier
            )
        }
    
}

extension ReportViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 2
        case 1:
            return 3
        case 2:
            return 5
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerContainerView
        
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionName[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let reportCell = tableView.dequeueReusableCell(
            withIdentifier: reportTableViewCell.identifier, for: indexPath)
                as? reportTableViewCell else { return UITableViewCell() }
        print(indexPath.section)
        switch indexPath.section {
        case 0 :
            reportCell.dataBind(model: dummy1[indexPath.row])
        case 1:
            reportCell.dataBind(model: dummy2[indexPath.row])
        case 2:
            reportCell.dataBind(model: dummy3[indexPath.row])
        default:
            reportCell.dataBind(model: dummy1[indexPath.row])
        }
        return reportCell
    }
}

// MARK: - UITableViewDelegate

extension ReportViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}

        // MARK: -
    
    


// MARK: - Network

