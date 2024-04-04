//
//  APIClient.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 07/02/24.
//

import Foundation

class APIClient {
    private init() {}
    static let shared = APIClient()
    
    func fetchData<T: Codable>(apiRouter: APIRouter) async throws -> T {
        guard let url = URL(string: apiRouter.urlString),
              var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            throw NetworkError.urlParsingError
        }
        
        urlComponents.queryItems = apiRouter.requestParams.map{ URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let unrappedUrl = urlComponents.url else {
            throw NetworkError.requestBodyParsingError
        }
        
        var urlRequest = URLRequest(url: unrappedUrl)
        urlRequest.httpMethod = apiRouter.httpMethod.rawValue
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.responseParsingError
        }
    }
}
