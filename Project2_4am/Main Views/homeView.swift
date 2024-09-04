//
//  homeView.swift
//  Project2_4am
//
//  Created by Ted Tan on 10/8/24.
//

import SwiftUI


struct homeView: View {
    
    struct bookmarkedSport: Identifiable {
        let id = UUID()
        let name: String
        let points: String
    }
    let sport = [
        bookmarkedSport(name: "Brisk Walk", points: "50 to 100"),
        bookmarkedSport(name: "Jogging", points: "80 to 150")]
    
    @EnvironmentObject var manager: HealthManager
    
    let progress: Double
    
    var body: some View {
        NavigationView { // Wrap your view in a NavigationView
            VStack{
                ZStack {
                    Circle()
                        .stroke(
                            Color.pink.opacity(0.5),
                            lineWidth: 20
                        )
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(
                            Color.pink,
                            style: StrokeStyle(
                                lineWidth: 20,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.degrees(-90))
                        .animation(.easeOut, value: progress)
                    
                    VStack{
                        Text("Step Goal")
                            .font(.title)
                            .padding()
                        Text("\(manager.todaysSteps) / 2000 ")
                            .font(.title)
                    }
                }
                .padding(30)
                NavigationView{
                    
                    List(sport) { sport in
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
                    }.navigationTitle("Bookmarks")
                }
                
            }.navigationTitle("Home") // Now this should work
        }
        
    }
}

#Preview{
    homeView(progress: 0.7) }
