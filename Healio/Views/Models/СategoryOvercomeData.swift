//
//  СategoryOvercomeData.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/31/24.
//

import SwiftUI

struct CategoryOvercomeData: Codable {
    let category: String
    let subcategories: [Subcategory]
    
    struct Subcategory: Codable {
        let name: String
        let description: String
    }
}

class CategoryOvercomeViewModel: ObservableObject {
    @Published var categoryData: CategoryOvercomeData?
    
    init() {
        loadJSON()
    }
    
    func loadJSON() {
        if let url = Bundle.main.url(forResource: "Row_overcome_repressed_emotions", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode(CategoryOvercomeData.self, from: data)
                categoryData = decodedData
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}
