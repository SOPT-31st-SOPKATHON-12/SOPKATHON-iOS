//
//  FriendModel.swift
//  MyPooDiary
//
//  Created by 이승헌 on 2022/11/20.
//

import Foundation

struct FriendModel: Codable {
    var image: String
    var name: String
}

let friendDummy: [FriendModel] = [
    FriendModel(image: "friend", name: "나"),
    FriendModel(image: "friend", name: "김솝트")
]
