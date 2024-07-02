//
//  SearchView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/27/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            BackgroundView()
                List {
                    Section(header: Text("A")) {
                        ForEach(searchResults, id: \.self) { result in
                            Text(result)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Search")
                .navigationBarItems(trailing:
                                        Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                )
                .searchable(text: $searchText)
            }
    }
    
    var searchResults: [String] {
        let allResults = [
            "Abdominal cramps", "Accidents", "Aches", "Acne", "Addictions",
            "Addison’s Disease", "Adenoids", "Adrenal Problems"
        ]
        if searchText.isEmpty {
            return allResults
        } else {
            return allResults.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

#Preview {
    SearchView()
}
