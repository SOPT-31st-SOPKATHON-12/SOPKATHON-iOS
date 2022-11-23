//
//  MainViewController.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import UIKit

import SnapKit
import Then

import Moya

final class MainViewController: UIViewController {

    // MARK: - Properties
    
    let recordProvider = MoyaProvider<RecordRouter>(
    plugins: [NetworkLoggerPlugin(verbose: true)])
    
    // MARK: - UI
    private let headerView: UIView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let dateLabel: UILabel = UILabel().then {
        $0.text = "2022년 11월 19일의 변기록이에요"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private let cheerUpView: UIView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
        $0.layer.shadowOpacity = 0.05
        $0.layer.shadowRadius = 20
    }
    
    private let cheerUpImage: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "user")
    }
    
    private let cheerUpLabel: UILabel = UILabel().then {
        $0.text = "이길동님 외 12명이 응원하고 있어요!"
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    private lazy var cheerUpButton: UIButton = UIButton().then {
        $0.backgroundColor = .clear
        $0.setTitle("친구들 응원하러 가기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        $0.addTarget(self, action: #selector(touchUpCheerUpButton), for: .touchUpInside)
    }
    
    @objc
    private func touchUpCheerUpButton() {
        let friendListViewController = FriendListViewController()
        friendListViewController.modalPresentationStyle = .fullScreen
        self.present(friendListViewController, animated: true)
    }
    
    private let rightShift: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "rightShift")
    }
    
    private lazy var tableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped).then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.sectionHeaderHeight = 145
        $0.delegate = self
        $0.dataSource = self
    }
    
    private let splitLine: UIView = UIView().then {
        $0.backgroundColor = .systemGray6
    }
    
    private let splitLineTwo: UIView = UIView().then {
        $0.backgroundColor = .systemGray6
    }
    
    private let logoHeader: UIView = UIView()
    
    private let logoImage: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "logo")
    }
    
    private let orderButton: UIButton = UIButton().then {
        $0.setImage(UIImage(named: "Order"), for: .normal)
        $0.addTarget(self, action: #selector(touchOrder), for: .touchUpInside)
    }
    
    @objc
    func touchOrder() {
        let report = ReportViewController()
        report.modalPresentationStyle = .overFullScreen
        
        self.present(report, animated: true)
    }
    
    private let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
    }
    
    private lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
        $0.backgroundColor = .clear
        $0.delegate = self
        $0.dataSource = self
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        register()
        setLayout()
//        getRecordAPI()
    }
    
    // MARK: - Functions

    // MARK: - @objc Function
    
}

// MARK: - Extensions

extension MainViewController {
    
    // MARK: - Set Layout
    
    private func setLayout() {
        view.addSubviews(logoHeader, tableView, splitLine, splitLineTwo, collectionView)
        
        logoHeader.addSubviews(logoImage, orderButton)
        
        headerView.addSubviews(
            dateLabel,
            cheerUpView
        )
        
        cheerUpView.addSubviews(
            cheerUpImage,
            cheerUpLabel,
            cheerUpButton,
            rightShift
        )
        
        logoHeader.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(66)
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(21)
            $0.leading.equalToSuperview().inset(24)
        }
        
        orderButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(27)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(logoHeader.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(102)
        }
        
        splitLine.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(tableView)
        }
        
        splitLineTwo.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(collectionView)
        }
        
        tableView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(collectionView.snp.bottom)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalTo(cheerUpView)
        }
        
        cheerUpView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).inset(-12)
            $0.width.equalTo(327)
            $0.height.equalTo(79)
            $0.centerX.equalToSuperview()
        }
        
        cheerUpImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(16)
        }
        
        cheerUpLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.leading.equalTo(cheerUpImage.snp.trailing).inset(-4)
        }
        
        cheerUpButton.snp.makeConstraints {
            $0.top.equalTo(cheerUpLabel.snp.bottom).inset(-7)
            $0.leading.equalTo(cheerUpImage.snp.trailing).inset(-4)
            $0.height.equalTo(19)
        }
        
        rightShift.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview().inset(112)
        }
    }
    
    // MARK: - General Helpers
    
    private func register() {
        tableView.register(RecordTableViewCell.self, forCellReuseIdentifier: RecordTableViewCell.identifier)
        collectionView.register(FriendCollectionViewCell.self, forCellWithReuseIdentifier: FriendCollectionViewCell.identifier)
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 347
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let recordCell = tableView.dequeueReusableCell(withIdentifier: RecordTableViewCell.identifier, for: indexPath) as? RecordTableViewCell else { return UITableViewCell() }
        
        recordCell.dataBind(model: recordDummy[indexPath.row])
        return recordCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyViewController = StoryViewController()
        storyViewController.modalPresentationStyle = .fullScreen
        self.present(storyViewController, animated: true)
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let friendCell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendCollectionViewCell.identifier, for: indexPath) as? FriendCollectionViewCell else { return UICollectionViewCell() }
        
        friendCell.dataBind(model: friendDummy[indexPath.item])

        if indexPath.item == 0 {
            friendCell.imageView.layer.borderWidth = 3
            friendCell.imageView.layer.borderColor = UIColor(hex: "0066FF").cgColor
        }
        return friendCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recordVC = RecordBottomSheet()
        recordVC.modalPresentationStyle = .overFullScreen
        self.present(recordVC, animated: true, completion: nil)
    }
}

// MARK: - Network

extension MainViewController {
    func getRecordAPI() {
        recordProvider.request(.getRecord) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                if status >= 200 && status < 300 {
                    do {
                        self.collectionView.reloadData()
                    }
                    catch(let error) {
                        print(error.localizedDescription)
                    }
                }
                if status >= 400 {
                    print("400 error")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

