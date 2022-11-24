//
//  FriendListResponseDto.swift
//  MyPooDiary
//
//  Created by 박의서 on 2022/11/24.
//

import Foundation

// MARK: - FriendListResponseDto
struct FriendListResponseDto: Codable {
    let status: Int
    let message: String
    let data: [FriendListResponseData]
}

// MARK: - Datum
struct FriendListResponseData: Codable {
    let name: String
    let isSupported: Bool
    
    
    func convertToFriendListModel() -> FriendListModel {
        return FriendListModel(friendImage: "friend", name: self.name)
    }
}
