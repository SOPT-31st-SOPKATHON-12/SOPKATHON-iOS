//
//  RecordRouter.swift
//  MyPooDiary
//
//  Created by devxsby on 2022/11/20.
//

import Foundation

import Moya

enum RecordRouter {
    case getRecord
}

extension RecordRouter: TargetType {
    var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getRecord:
            return "/record"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case.getRecord:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getRecord:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
