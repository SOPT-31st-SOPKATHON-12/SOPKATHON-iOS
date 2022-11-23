//
//  RecordRequestDto.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/23.
//

import Foundation

// MARK: - RecordRequestDto

struct RecordRequestDto: Codable {
    var userId: Int
    var satisfy: Bool
    var color: Int?
    var strength: Int?
    
    init(_ userId: Int, _ satisfy: Bool, color: Int?, strength: Int?) {
        self.userId = 1
        self.satisfy = satisfy
        self.color = color
        self.strength = strength
    }
}
