//
//  APIRequestable.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 08/02/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol APIRequestable {
    var urlString: String { get }
    var httpMethod: HTTPMethod { get }
    var requestParams: [String: String] { get }
}

extension APIRequestable {
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var requestParams: [String: String] {
        return [:]
    }
}
