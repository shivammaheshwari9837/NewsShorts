//
//  NewsListResponseModel.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 07/02/24.
//

import Foundation

struct NewsListResponseModel: Codable {
    let status: String?
    let listOfNews: [NewsDetailResponseModel]?
    
    enum CodingKeys: String, CodingKey {
        case status
        case listOfNews = "articles"
    }
}

struct NewsDetailResponseModel: Codable, Identifiable {
    var id: String {
        return UUID().uuidString
    }
    public let description: String?
    public let urlToImage: String?
}
