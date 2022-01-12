//
//  APIType.swift
//  Sports
//
//  Created by Anton Khlomov on 13/01/2022.
//

import Foundation

enum APIType {
    case getMatchInfo
    case getMatchLinks
    
    var baseURL: URL {
      return URL(string: "http://144.76.179.3:17777/test/data")!
    }
    
    var headers: [String: String] {
      switch self {
      case .getMatchInfo, .getMatchLinks:
        return ["Content-Type": "application/json"]
      }
    }
    
    var path: String {
        switch self {
        case .getMatchInfo:
            return "data"
        case .getMatchLinks:
            return "video-urls"
        }
    }
    
    var method: String {
        switch self {
        case .getMatchInfo, .getMatchLinks:
            return "POST"
        }
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: baseURL)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method
        return request
    }
}
