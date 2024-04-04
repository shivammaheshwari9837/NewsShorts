//
//  APIRouter.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 08/02/24.
//

import Foundation

enum APIRouter: APIRequestable {
    case newsListTopHeadlines(newsListRequestBody: NewsListTopHeadlinesRequestBody)
    case insightsList(insightsRequestBody: NewsListTopHeadlinesRequestBody)
    
    var urlString: String {
        switch self {
        case .newsListTopHeadlines, .insightsList:
            return APIUrlConstants.topHeadlinesNews
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .newsListTopHeadlines, .insightsList:
            return .get
        }
    }
    
    var requestParams: [String : String] {
        switch self {
        case .newsListTopHeadlines(let requestBody), .insightsList(let requestBody):
            return ["apiKey": requestBody.apiKey, "country": requestBody.country]
        }
    }
}
