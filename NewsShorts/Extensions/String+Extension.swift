//
//  String+Extension.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 04/03/24.
//

import Foundation

extension String {
    func trimStringTo(words: Int) -> String {
        let totalWords = self.components(separatedBy: " ")
        let trimmedWords = Array(totalWords.prefix(words))
        return trimmedWords.joined(separator: " ") + "."
    }
}
