//
//  FriendStoryResponseDto.swift
//  MyPooDiary
//
//  Created by 박의서 on 2022/11/25.
//

import Foundation

// MARK: - FriendStoryResponseDto
struct FriendStoryResponseDto: Codable {
    let status: Int
    let message: String
    let data: FriendStoryResponseData
}

// MARK: - DataClass
struct FriendStoryResponseData: Codable {
    let recordID, user: Int
    let satisfy: Bool
    let color, strength: Int?
    let supportCnt: Int
    let date: String

    enum CodingKeys: String, CodingKey {
        case recordID = "recordId"
        case user, satisfy, color, strength
        case supportCnt = "support_cnt"
        case date
    }
}

