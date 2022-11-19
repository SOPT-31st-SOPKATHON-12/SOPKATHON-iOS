//
//  RecordResponseDto.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import Foundation

// MARK: - Welcome
struct ExampleResponseDto: Codable {
    let status: Int
    let message: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
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
