//
//  NetworkError.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 07/02/24.
//

import Foundation

enum NetworkError: Error {
    case urlParsingError
    case responseParsingError
    case requestBodyParsingError
}
