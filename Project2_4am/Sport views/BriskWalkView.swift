//
//  BriskWalkView.swift
//  Project2_4am
//
//  Created by Andrew Tan Li-Onn on 10/8/24.
//

import SwiftUI

struct BriskWalkView: View {
    
    @State private var warmUpSheet = false
    @State private var progress = false
    @State private var selectedDistance: Double = 0.0
            let distanceOptions: [Double] = [1.0,1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0]
    @State private var selectedTime = 0
        let timeOptions = [15,25,35,45,55,65,75,85,95]
    
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
                    Button {
                        warmUpSheet = true
                    } label: {
                        Text("Warm up")
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
    BriskWalkView()
}



