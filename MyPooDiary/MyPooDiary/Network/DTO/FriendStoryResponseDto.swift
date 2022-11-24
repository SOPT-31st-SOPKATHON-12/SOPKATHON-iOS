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
    let color, strength: JSONNull?
    let supportCnt: Int
    let date: String

    enum CodingKeys: String, CodingKey {
        case recordID = "recordId"
        case user, satisfy, color, strength
        case supportCnt = "support_cnt"
        case date
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
