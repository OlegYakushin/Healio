//
//  CategoryData.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/31/24.
//

import SwiftUI

struct CategoryData: Codable {
    let category: String
    let subcategories: [String]
}

class CategoryViewModel: ObservableObject {
    @Published var categoryData: CategoryData?
    
    init() {
        loadJSON()
    }
    
    func loadJSON() {
        if let url = Bundle.main.url(forResource: "Row_cultivate_positive_emotions", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode(CategoryData.self, from: data)
                categoryData = decodedData
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}

