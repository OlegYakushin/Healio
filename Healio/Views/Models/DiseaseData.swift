//
//  DiseaseData.swift
//  Healio
//
//  Created by Oleg Yakushin on 7/31/24.
//

import SwiftUI

struct DiseaseData: Codable, Identifiable {
    let id = UUID()
    let disease: String
    let problemCause: String
    let tags: [String]
    
    enum CodingKeys: String, CodingKey {
        case disease = "Disease"
        case problemCause = "Problem Cause"
        case tags = "Tags"
    }
}

class DiseaseViewModel: ObservableObject {
    @Published var diseases: [DiseaseData] = []
    
    init() {
        loadJSON()
    }
    
    func loadJSON() {
        if let url = Bundle.main.url(forResource: "Diseases_list_plus_home_row_tags", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode([DiseaseData].self, from: data)
                diseases = decodedData
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}

extension DiseaseViewModel {
    func groupedByTags() -> [String: [DiseaseData]] {
        Dictionary(grouping: diseases, by: { $0.tags.first ?? "Unknown" })
    }
}
