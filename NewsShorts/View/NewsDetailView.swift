//
//  NewsDetailView.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 04/03/24.
//

import SwiftUI

struct NewsDetailView: View {
    private let newsImageUrlString: String
    private let newsTitle: String
    private let newsDetails: String
    private let newsWebsiteUrlString: String
    private let backNavigationTitle: String
    
    init(newsImageUrlString: String, 
         newsTitle: String,
         newsDetails: String,
         newsWebsiteUrlString: String,
         backNavigationTitle: String) {
        self.newsImageUrlString = newsImageUrlString
        self.newsTitle = newsTitle
        self.newsDetails = newsDetails
        self.newsWebsiteUrlString = newsWebsiteUrlString
        self.backNavigationTitle = backNavigationTitle
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                AsyncImage(url: URL(string: newsImageUrlString)) { image in
                    image
                        .resizable()
                        .aspectRatio(4/3, contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width)
                } placeholder: {
                    ProgressView()
                }
                
                VStack(spacing: 15) {
                    Text(newsTitle.trimStringTo(words: 10))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineSpacing(7)
                        .font(.system(size: 20))
                        .bold()
                        .font(.system(.headline))
                    
                    Text(newsDetails.trimStringTo(words: 60))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineSpacing(7)
                }
                .padding(.top, 20)
                .padding(.horizontal, 10)
                
                Spacer()
            }
            .navigationTitle(backNavigationTitle)
        }
    }
}

#Preview {
    NewsDetailView(newsImageUrlString: "https://www.livemint.com/lm-img/img/2024/03/03/1600x900/Shehbaz_Sharif_1709481525992_1709481526179.jpg", newsTitle: "'Freedom of Kashmiris...': Pakistan's newly elected PM Shehbaz Sharif in first speech | Mint - Mint", newsDetails: "Elected as the next prime minister of Pakistan, Shehbaz Sharif appealed to his country's parliament to pass a resolution on the 'freedom of Kashmiris and Palestianians' in his maiden speech. Elected as the next prime minister of Pakistan, Shehbaz Sharif appealed to his country's parliament to pass a resolution on the 'freedom of Kashmiris and Palestianians' in his maiden speech. Elected as the next prime minister of Pakistan, Shehbaz Sharif appealed to his country's parliament to pass a resolution on the 'freedom of Kashmiris and Palestianians' in his maiden speech. Elected as the next prime minister of Pakistan, Shehbaz Sharif appealed to his country's parliament to pass a resolution on the 'freedom of Kashmiris and Palestianians' in his maiden speech.", newsWebsiteUrlString: "https://www.livemint.com/news/freedom-of-kashmiris-pakistans-newly-elected-pm-shehbaz-sharif-in-first-speech-11709481127392.html", backNavigationTitle: "Discover")
}
