//
//  RegionlNewsView.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 20/03/24.
//

import SwiftUI
import VisionaryUI

enum TopicsNews: String, CaseIterable {
    case business
    case entertainment
    case general
    case health
    case science
    case sports
    case technology
}

struct TopicsNewsView: View {
    var body: some View {
        VStack {
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text("Topics")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                    .font(.system(size: 20))
                    .foregroundStyle(.black)
                
                Rectangle()
                    .fill(.black)
                    .frame(width: 35 , height: 1)
            }
            .padding(.bottom, 10)
            
            
        }
    }
}

#Preview {
    TopicsNewsView()
}
