//
//  ContentView.swift
//  NewsShorts
//
//  Created by Shivam Maheshwari on 05/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var shortNotificationViewModel: ShortNotificationViewViewModel = .init()
    @StateObject var insightsNewsViewModel: InsightsViewViewModel = .init()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    
                    HorizontalDirectFeedView()
                        .padding(.top, 15)
                    
                    ShortNotificationView(viewModel: shortNotificationViewModel)
                        .padding()
                    
                    InsightsView(viewModel: insightsNewsViewModel)
                        .padding(.leading)
                }
            }
            .refreshable {
                Task {
                    shortNotificationViewModel.fetchTopThreeNewsListFromAPI()
                }
                Task {
                    insightsNewsViewModel.fetchNewsInsightsFromAPI()
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "gearshape")
                        .foregroundStyle(.blue)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Text("My Feed")
                        Image(systemName: "arrowshape.forward.fill")
                            .foregroundStyle(.blue)
                    }
                }
            })
        }
        .onAppear(perform: {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.shadowColor = .black
            appearance.shadowImage = UIImage()
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        })
    }
}

#Preview {
    ContentView()
}
