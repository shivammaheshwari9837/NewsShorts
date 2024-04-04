//
//  NewsListRequestBody.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 07/02/24.
//

import Foundation

struct NewsListTopHeadlinesRequestBody: Codable {
    let apiKey: String
    let country: String
}
