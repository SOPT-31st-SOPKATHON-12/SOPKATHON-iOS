//
//  FriendsRouter.swift
//  MyPooDiary
//
//  Created by 박의서 on 2022/11/24.
//


import Foundation
import Moya

enum FriendsRouter {
    case fetchFriendList
    case fetchFriendStory
}

extension FriendsRouter: TargetType {
    var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .fetchFriendList:
            return "/friend"
        case .fetchFriendStory:
            return "/friend/1"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchFriendList:
            return .get
        case .fetchFriendStory:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchFriendList:
            return .requestPlain
        case .fetchFriendStory:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
}
