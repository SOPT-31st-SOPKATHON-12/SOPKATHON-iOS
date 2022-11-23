//
//  RecordRouter.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import Foundation

import Moya

enum RecordRouter {
    case fetchRecord(param: RecordRequestDto)
}

extension RecordRouter: TargetType {
    var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .fetchRecord:
            return "/record"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchRecord:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchRecord(let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
}
