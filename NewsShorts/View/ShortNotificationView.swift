//
//  ShortNotificationView.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 16/02/24.
//

import SwiftUI

struct ShortNotificationView: View {
    
    @ObservedObject private var viewModel: ShortNotificationViewViewModel

    init(viewModel: ShortNotificationViewViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text("Notifications")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                    .font(.system(size: 20))
                    .foregroundStyle(.black)
                
                Rectangle()
                    .fill(.black)
                    .frame(width: 35 , height: 1)
            }
            .padding(.bottom, 10)
            
            VStack(spacing: 20) {
                ForEach(viewModel.shortNewsList) { model in
                    NavigationStack {
                        ShortNotificationsNewsDetailNavigationView(newsDetailsModel: model)
                    }
                }
            }
        }
    }
}

#Preview {
    ShortNotificationView(viewModel: .init())
}

struct ShortNotificationsNewsDetailNavigationView: View {
    let newsDetailsModel: NewsDetailResponseModel
    var body: some View {
        if let description = newsDetailsModel.description,
           let stringUrl = newsDetailsModel.urlToImage {
            NavigationLink {
                if let newsTitle = newsDetailsModel.title,
                   let newsWebsiteUrlString = newsDetailsModel.url {
                    NewsDetailView(newsImageUrlString: stringUrl, newsTitle: newsTitle, newsDetails: description, newsWebsiteUrlString: newsWebsiteUrlString, backNavigationTitle: "Short Notifications")
                }
            } label: {
                VStack {
                    ShortNotificationCellView(description: description, imageUrl: stringUrl)
                    Divider()
                }
            }
        }
    }
}
