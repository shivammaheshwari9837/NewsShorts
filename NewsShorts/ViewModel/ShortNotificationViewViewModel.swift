//
//  ShortNotificationViewViewModel.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 16/02/24.
//

import Foundation

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
                self.shortNewsList = Array(newsList.prefix(3))
            }
        }
    }
}
