//
//  ShortNotificationViewViewModel.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 16/02/24.
//

import Foundation

protocol ValidFilterDataProtocol {
    associatedtype CodableType: Codable
    func filterValidNews(newsData: [CodableType]) -> [CodableType]
}

class ShortNotificationViewViewModel: ObservableObject {
    @Published var shortNewsList: [NewsDetailResponseModel] = []
    private let apiClient: APIClient
    
    init(apiClient: APIClient = APIClient.shared) {
        self.apiClient = apiClient
        updateNewsList()
    }
    
    func updateNewsList() {
        fetchTopThreeNewsListFromAPI()
    }
}

extension ShortNotificationViewViewModel {
    func fetchTopThreeNewsListFromAPI() {
        let requestBody = NewsListTopHeadlinesRequestBody(apiKey: APIKeyConstants.apiKey, country: "in")
        let apiRouter = APIRouter.newsListTopHeadlines(newsListRequestBody: requestBody)
        Task {
            let responseBody: NewsListResponseModel = try await self.apiClient.fetchData(apiRouter: apiRouter)
            guard let newsList = responseBody.listOfNews else {
                return
            }
            DispatchQueue.main.async {
                self.shortNewsList = Array(self.filterValidNews(newsData: newsList).prefix(3))
            }
        }
    }
}

/// Created due to free API limitations
extension ShortNotificationViewViewModel: ValidFilterDataProtocol {
    func filterValidNews(newsData: [NewsDetailResponseModel]) -> [NewsDetailResponseModel] {
        newsData.filter { model in
            model.description != nil && model.urlToImage != nil && model.title != nil && model.url != nil
        }
    }
}
