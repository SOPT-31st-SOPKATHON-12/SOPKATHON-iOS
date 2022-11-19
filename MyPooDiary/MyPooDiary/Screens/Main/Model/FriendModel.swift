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
    FriendModel(image: "friend", name: "박지수"),
    FriendModel(image: "friend", name: "이승헌"),
    FriendModel(image: "friend", name: "최민수"),
    FriendModel(image: "friend", name: "김수환"),
    FriendModel(image: "friend", name: "이제니"),
    FriendModel(image: "friend", name: "박현아")
]
