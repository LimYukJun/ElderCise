//
//  SportvIEW.swift
//  Project2_4am
//
//  Created by Andrew Tan Li-Onn on 10/8/24.
//

import SwiftUI

struct SportView: View {
    
    @State private var searchText = ""
    
    struct Sport: Identifiable {
        let id = UUID()
        let name: String
        let points: String
    }

    let sports = [
        Sport(name: "Brisk Walk", points: "50 to 100"),
        Sport(name: "Jogging", points: "80 to 150"),
        Sport(name: "Yoga", points: "20"),
        Sport(name: "Pickleball", points: "70 to 120"),
        Sport(name: "Tai Chi", points: "40"),
        Sport(name: "Hiking", points: "60"),
        Sport(name: "Warm up", points: "10")
    ]
    
    var filteredSports: [Sport] {
            if searchText.isEmpty {
                return sports
            } else {
                return sports.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            }
        }
    
    var body: some View {
        NavigationView {
            
            List(filteredSports) { sport in
                NavigationLink {
                    if(sport.name == "Jogging"){
                        JoggingView()
                            .navigationTitle("Jogging")
                            
                    } else if (sport.name == "Brisk Walk"){
                        BriskWalkView()
                            .navigationTitle("Brisk Walk")
                            
                    }
                } label: {
                    HStack {
                        Text(sport.name)
                        Spacer()
                        Text(sport.points)
                    }
                }
                
            }
            .navigationTitle("Sports")
            .searchable(text: $searchText, prompt: "Search for a sport")


        }

    }
}

#Preview {
    SportView()
}
