//
//  InsightsView.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 20/02/24.
//

import SwiftUI

struct InsightsView: View {
    
    @ObservedObject private var viewModel: InsightsViewViewModel = .init()
    @State private var progressBarOffset: CGFloat = 0.0
    let timer = Timer.publish(every: 1.0, tolerance: 0.1, on: .main, in: .common).autoconnect()

    init(viewModel: InsightsViewViewModel) {
        self.viewModel = viewModel
    }
        
    var body: some View {
        let _ = Self._printChanges()
        VStack {
            Text("Insights")
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
                .font(.system(size: 20))
                .foregroundStyle(.black)
            
            ZStack(alignment: .leading) {
                
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(height: 4)
                
                Rectangle()
                    .fill(.blue)
                    .frame(width: 30, height: 3, alignment: .leading)
                    .offset(x: progressBarOffset, y: 0)
            }
            
            InsightsCardsView(viewModel: viewModel)
        }
    }
}

#Preview {
    InsightsView(viewModel: .init())
}

struct InsightsCardsView: View {
    
    @StateObject var viewModel: InsightsViewViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(viewModel.insightsList) { model in
                    NavigationStack {
                        InsightsNotificationsNewsDetailNavigationView(newsDetailsModel: model)
                    }
                }
            }
        }
        .padding(.top, 15)
    }
}

struct InsightsNotificationsNewsDetailNavigationView: View {
    let newsDetailsModel: InsightsDetailResponseModel
    var body: some View {
        if let urlToImage = newsDetailsModel.urlToImage {
            NavigationLink {
                if let description = newsDetailsModel.description,
                    let newsTitle = newsDetailsModel.title,
                    let newsWebsiteUrlString = newsDetailsModel.url {
                    NewsDetailView(newsImageUrlString: urlToImage, newsTitle: newsTitle, newsDetails: description, newsWebsiteUrlString: newsWebsiteUrlString, backNavigationTitle: "Insights")
                }
            } label: {
                AsyncImage(url: URL(string: urlToImage)) { image in
                    image
                        .resizable()
                        .frame(width: 100, height: 150)
                        .background(.gray.opacity(0.1))
                        .scaledToFit()
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                }

            }
        }
    }
}
