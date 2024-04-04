//
//  ShortNotificationCellView.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 17/02/24.
//

import SwiftUI

struct ShortNotificationCellView: View {
    let description: String
    let imageUrl: String
    
    @State private var multilineTextHeight: CGFloat?
    
    var body: some View {
        HStack(spacing: 25) {
            Text(description)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 14))
                .lineLimit(3)
                .lineSpacing(5)
                .foregroundStyle(.black)
            Spacer()
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .background(.gray.opacity(0.1))
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .cornerRadius(2.0)
            .frame(width: 100, height: 60)
        }
    }
}

#Preview {
    ShortNotificationCellView(description: "India vs England Live Score 3rd Test Day 2, IND vs ENG: Ashwin and Jurel keep India steady, taking the side past the 400-run mark during 2nd session", imageUrl: "https://www.hindustantimes.com/ht-img/img/2024/02/16/550x309/india_vs_england_live_score_1708058694352_1708058702429.JPG")
}
