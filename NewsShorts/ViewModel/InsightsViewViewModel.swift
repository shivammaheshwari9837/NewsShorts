//
//  InsightsViewViewModel.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 20/02/24.
//

import Foundation

class InsightsViewViewModel: ObservableObject {
    @Published var insightsList: [InsightsDetailResponseModel] = []
    private let apiClient: APIClient
    
    init(apiClient: APIClient = APIClient.shared) {
        self.apiClient = apiClient
        fetchInsightsNews()
    }
    
    func fetchInsightsNews() {
        fetchNewsInsightsFromAPI()
    }
}

extension InsightsViewViewModel {
    func fetchNewsInsightsFromAPI() {
        let requestBody = NewsListTopHeadlinesRequestBody(apiKey: APIKeyConstants.apiKey, country: "in")
        
        let apiRouter = APIRouter.insightsList(insightsRequestBody: requestBody)
        Task {
            let responseBody: InsightsResponseModel = try await self.apiClient.fetchData(apiRouter: apiRouter)
            guard let newsInsights = responseBody.listOfInsights else {
                return
            }
            
            DispatchQueue.main.async {
                self.insightsList = Array(self.filterValidNews(newsData: newsInsights).reversed().prefix(8))
            }
        }
    }
}

/// Created due to free API limitations
extension InsightsViewViewModel: ValidFilterDataProtocol {
    func filterValidNews(newsData: [InsightsDetailResponseModel]) -> [InsightsDetailResponseModel] {
        newsData.filter { model in
            model.description != nil && model.urlToImage != nil && model.title != nil
        }
    }
}
