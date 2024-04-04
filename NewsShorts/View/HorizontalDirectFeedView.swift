//
//  HorizontalDirectFeedView.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 08/02/24.
//

import SwiftUI

struct FeedModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let imageName: String
}

struct HorizontalDirectFeedView: View {
    private let feedData: [FeedModel] = [
        FeedModel(title: "My Feed", imageName: "book.closed"),
        FeedModel(title: "All News", imageName: "newspaper.fill"),
        FeedModel(title: "Top Stories", imageName: "star.fill"),
        FeedModel(title: "Trending", imageName: "flame"),
        FeedModel(title: "Bookmarks", imageName: "bookmark"),
        FeedModel(title: "Unread", imageName: "eye")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 45) {
                ForEach(feedData) { model in
                    DirectFeedView(model: model)
                }
            }
            .padding()
        }
    }
}

#Preview {
    HorizontalDirectFeedView()
}

struct DirectFeedView: View {
    let model: FeedModel
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: model.imageName)
                .resizable()
                .frame(width: 30, height: 40)
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.blue)
            Text(model.title)
                .font(.system(size: 15))
        }
    }
}
