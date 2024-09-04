//
//  OthersView.swift
//  Project2_4am
//
//  Created by Andrew Tan Li-Onn on 10/8/24.
//

import SwiftUI

struct JoggingView: View {
    
    @State private var warmUpSheet = false
    @State private var selectedDistance: Double = 0.0
            let distanceOptions: [Double] = [0.5, 0.75,1.0,1.25,1.5,1.75,2.0,2.25,2.5,2.75,3.0]
        @State private var selectedTime = 0
            let timeOptions = [5,10,15,20,25,30,35]
        @State private var bookmarked = false
        @State private var progress = false

    
    
    
    var body: some View {
        
            List{
                Picker("Distance/ km", selection: $selectedDistance) {
                    ForEach(distanceOptions, id: \.self) {option in
                        Text(String(format: "%.2f",option))
                            .tag("\(option)")
                            .id("\(option)")
                    }
                }
                Picker("Time/ minutes", selection: $selectedTime) {
                    ForEach(timeOptions, id: \.self) {option in
                        Text("\(option)")
                    }
                }
                Text("Moderate Intensity")
                    .font(.headline)
                Text("50 points")
                    .font(.headline)
                
                Section{
                    HStack{
                        Text("You can do this anywhere, the gym, the track or the park.")
                            .multilineTextAlignment(.center)
                    }
                    
                }
                Section{
                    Button("Warm Up") {
                        warmUpSheet = true
                    }
                    Button("Start Activity") {
                        progress = true
                    }
                    
                }
                
            }
            
            .sheet(isPresented: $warmUpSheet, content: {
                WarmUpView()
            })
            .fullScreenCover(isPresented: $progress) {
                JoggingProgressView()
            
        }
    }
      
}


#Preview {
    JoggingView()
}
