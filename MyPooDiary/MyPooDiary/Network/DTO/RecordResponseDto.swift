//
//  RecordResponseDto.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import Foundation

// MARK: - RecordResponseDto

struct RecordResponseDto: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let recordID, user: Int
    let satisfy: Bool
    let color, strength, supportCnt: Int
    let date: String

    enum CodingKeys: String, CodingKey {
        case recordID = "recordId"
        case user, satisfy, color, strength
        case supportCnt = "support_cnt"
        case date
    }
}
