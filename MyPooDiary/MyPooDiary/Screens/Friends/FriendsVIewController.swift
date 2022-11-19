//
//  FriendsViewController.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import UIKit

import SnapKit
import Then

import Moya

final class FriendsViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - UI
    private let topBar =  UIView()
    private lazy var backButton = makeButton("")
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    // MARK: - Functions

    // MARK: - @objc Function
    
}

// MARK: - Extensions
extension FriendsViewController {
    
    //MARK: - Custom Method
    
    private func setUI(){
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(topBar)
        
        // MARK: - TopBar View Constraints
        topBar.backgroundColor = .systemGray2
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
    }
    
    private func makeButton(_ imageString: String)-> UIButton{
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: imageString), for: .normal)
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .systemGray
        return button
    }
}

// MARK: - Network

