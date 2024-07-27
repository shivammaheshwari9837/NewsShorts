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
    case topicsNewsList(topicsNewsRequestBody: TopicsNewsRequestBody)
    
    var urlString: String {
        switch self {
        case .newsListTopHeadlines, .insightsList:
            return APIUrlConstants.topHeadlinesNews
        case .topicsNewsList:
            return APIUrlConstants.topicsNews
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .newsListTopHeadlines, .insightsList, .topicsNewsList:
            return .get
        }
    }
    
    var requestParams: [String : String] {
        switch self {
        case .newsListTopHeadlines(let requestBody), .insightsList(let requestBody):
            return ["apiKey": requestBody.apiKey, "country": requestBody.country]
        case .topicsNewsList(let requestBody):
            return ["apiKey": requestBody.apiKey, "category": requestBody.category]
        }
    }
}
