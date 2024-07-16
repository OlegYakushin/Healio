//
//  SearchView.swift
//  Healio
//
//  Created by Oleg Yakushin on 6/27/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var selectedLetter: String? = nil
    
    let allResults: [String] = [
        "Abdominal cramps", "Accidents", "Aches", "Acne", "Addictions",
        "Addison’s Disease", "Adenoids", "Adrenal Problems", "Back Pain",
        "Burns", "Cancer", "Cough", "Cold", "Diabetes", "Dizziness",
        "Ear Infection", "Fatigue", "Fever", "Headache", "Hypertension",
        "Infection", "Jaundice", "Kidney Stones", "Liver Disease",
        "Migraine", "Nausea", "Obesity", "Pain", "Quarantine", "Rash",
        "Stomach Ache", "Thyroid Issues", "Ulcer", "Vomiting", "Wounds",
        "X-ray", "Yeast Infection", "Zinc Deficiency"
    ]
    init() {
        let appear = UINavigationBarAppearance()

        let atters: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "AveriaSerifLibre-Light", size: 40)!
        ]
        let atters2: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "AveriaSerifLibre-Light", size: 20)!
        ]
        appear.largeTitleTextAttributes = atters
        appear.titleTextAttributes = atters2
        UINavigationBar.appearance().standardAppearance = appear
      
     }
    var body: some View {
        NavigationView {
            ZStack(alignment: .trailing) {
                BackgroundView()
                ScrollViewReader { proxy in
                    List {
                        ForEach(filteredResults.keys.sorted(), id: \.self) { key in
                            Section(header: Text(key) .font(.custom("Averta-Semibold", size: 16  * sizeScreen())).foregroundColor(Color("bronzeOne")).id(key)) {
                                ForEach(filteredResults[key]!, id: \.self) { result in
                                    Text(result)
                                        .font(.custom("Averta-Semibold", size: 16  * sizeScreen()))
                                        .foregroundColor(Color("fontDark"))
                                        .listRowBackground(Color.clear)
                                }
                                .background(Color.clear)
                            }
                          
                        }
                    }
                    
                    .listStyle(PlainListStyle())
                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                    .navigationBarTitle(
                                           Text("Search")
                                           )
               
                    
                   
                }
            }
        }
    }
    
    var filteredResults: [String: [String]] {
        let groupedResults = Dictionary(grouping: allResults) { $0.prefix(1).uppercased() }
        
        if searchText.isEmpty {
            return groupedResults
        } else {
            let filtered = allResults.filter { $0.localizedCaseInsensitiveContains(searchText) }
            return Dictionary(grouping: filtered) { $0.prefix(1).uppercased() }
        }
    }
    
    var alphabet: [String] {
        return (65...90).map { String(UnicodeScalar($0)) }
    }
}

#Preview {
    SearchView()
}
