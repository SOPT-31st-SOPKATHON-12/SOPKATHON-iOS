//
//  FriendListViewController.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import UIKit

import SnapKit
import Then

import Moya

final class FriendListViewController: UIViewController {

    // MARK: - Properties
    var friendList: [FriendModel] = [
        FriendModel(friendImage: "userIcon", name: "💩"),
        FriendModel(friendImage: "userIcon", name: "💩"),
        FriendModel(friendImage: "userIcon", name: "💩")
    ]
    
    // MARK: - UI
    private let topBar =  UIView()
    private lazy var backButton = makeButton("Expand_left")
    private lazy var friendsTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.separatorStyle = .none
        $0.delegate = self
        $0.dataSource = self
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setLayout()
    }
    
    // MARK: - Functions

    // MARK: - @objc Function
    
}

// MARK: - Extensions
extension FriendListViewController {
    
    // MARK: - Custom Method
    
    private func setLayout() {
        view.backgroundColor = .white
        
        view.addSubviews(topBar, friendsTableView)
        
        // MARK: - TopBar View Constraints
        topBar.addSubviews(backButton)
        topBar.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(66)
        }
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(27)
            $0.width.equalTo(25)
            $0.height.equalTo(34)
        }
        
        // MARK: - FriendsTableView Constraints
        friendsTableView.snp.makeConstraints {
            $0.top.equalTo(topBar.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(70 * friendList.count)
        }
    }
    
    private func makeButton(_ imageString: String)-> UIButton{
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: imageString), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }
    
//    @objc
//    private func pushToFriendViewController() {
//        let friendViewController = FriendViewController()
//
//        self.navigationController?.pushViewController(friendViewController, animated: true)
//    }
    
    // MARK: - General Helpers
    
    private func register() {
        friendsTableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
    }
}

// MARK: - UITableViewDelegate

extension FriendListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

// MARK: - UITableViewDataSource

extension FriendListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
        friendCell.dataBind(model: friendList[indexPath.row])
        return friendCell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        pushToFriendViewController()
//    }
    
    
}

// MARK: - Network

