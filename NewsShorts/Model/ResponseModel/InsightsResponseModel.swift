//
//  InsightsViewResponseModel.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 20/02/24.
//

import Foundation

struct InsightsResponseModel: Codable {
    let status: String?
    let listOfInsights: [InsightsDetailResponseModel]?
    
    enum CodingKeys: String, CodingKey {
        case status
        case listOfInsights = "articles"
    }
    
}

struct InsightsDetailResponseModel: Codable {
    public let urlToImage: String?
}
