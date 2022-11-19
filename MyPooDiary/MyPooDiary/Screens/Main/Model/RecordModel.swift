//
//  RecordModel.swift
//  MyPooDiary
//
//  Created by 이승헌 on 2022/11/20.
//

import Foundation

struct RecordModel: Codable {
    var image: String
    var time: String
}

let recordDummy: [RecordModel] = [
    RecordModel(image: "dummyOne", time: "오후 11:52"),
    RecordModel(image: "dummyTwo", time: "오후 11:52"),
    RecordModel(image: "dummyThree", time: "오후 11:52")
]
