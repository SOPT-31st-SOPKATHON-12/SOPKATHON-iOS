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
    var friendList: [FriendListModel] = [
        FriendListModel(friendImage: "icon_profile", name: "이길동"),
        FriendListModel(friendImage: "icon_profile", name: "노한솔"),
        FriendListModel(friendImage: "icon_profile", name: "박의서"),
        FriendListModel(friendImage: "icon_profile", name: "김유빈"),
        FriendListModel(friendImage: "icon_profile", name: "이승헌"),
        FriendListModel(friendImage: "icon_profile", name: "김은수"),
        FriendListModel(friendImage: "icon_profile", name: "윤수빈"),
        FriendListModel(friendImage: "icon_profile", name: "김인영"),
        FriendListModel(friendImage: "icon_profile", name: "이화정"),
        FriendListModel(friendImage: "icon_profile", name: "전희선"),
        FriendListModel(friendImage: "icon_profile", name: "손혜정"),
        FriendListModel(friendImage: "icon_profile", name: "박서원")
    ]
    
    // MARK: - UI
    private let topBar =  UIView()
    private lazy var backButton = makeButton("Expand_left").then {
        $0.addTarget(self, action: #selector(touchUpBackButton), for: .touchUpInside)
    }
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
    @objc
    private func touchUpBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
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
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func makeButton(_ imageString: String)-> UIButton{
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: imageString), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }
    

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friendViewController = FriendViewController()
        friendViewController.modalPresentationStyle = .overFullScreen
        self.present(friendViewController, animated: true)
    }
}
    
    // MARK: - Network

