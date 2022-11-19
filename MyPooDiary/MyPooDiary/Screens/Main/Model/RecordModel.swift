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
    RecordModel(image: "img_defalt", time: "오후 11:52"),
    RecordModel(image: "img_regular_green", time: "오후 14:20"),
    RecordModel(image: "img_soft_red", time: "오전 07:45")
]
