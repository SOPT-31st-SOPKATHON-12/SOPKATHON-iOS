//
//  FriendListRouter.swift
//  MyPooDiary
//
//  Created by 박의서 on 2022/11/24.
//


import Foundation
import Moya

enum FriendListRouter {
    case fetchFriendList
}

extension FriendListRouter: TargetType {
    var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .fetchFriendList:
            return "/friend"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchFriendList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchFriendList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
}