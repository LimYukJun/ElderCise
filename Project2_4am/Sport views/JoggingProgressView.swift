//
//  InProgressView.swift
//  Project2_4am
//
//  Created by Andrew Tan Li-Onn on 17/8/24.
//

import SwiftUI

struct JoggingProgressView: View {
    @State private var progress: CGFloat = 0.625 // Progress value (e.g., 1.5km of 2.4km)
    @State private var time = "09:21"
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Activity in progress")
                .font(.largeTitle)
                .bold()
                .padding(.top, 50)
            
            ZStack {
                // Background Circle
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                    .frame(width: 250, height: 250)
                
                // Progress Circle
                Circle()
                    .trim(from: 0, to: progress) // Based on the progress
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .rotationEffect(Angle(degrees: 270)) // Starts from top
                    .frame(width: 250, height: 250)
                
                // Timer Text
                VStack {
                    Text(time)
                        .font(.system(size: 48))
                        .bold()
                        .foregroundColor(.blue)
                    
                    Text("1.5km / 2.4km")
                        .font(.title)
                        .foregroundColor(.blue)
                }
            }
            .padding(.vertical, 50)
            
            // Stop Button
            Button(action: {
                // Handle Stop action here
            }) {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Stop")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.red)
                        .cornerRadius(10)
                })
            }
            .padding(.bottom, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

struct JoggingProgressView_Previews: PreviewProvider {
    static var previews: some View {
        JoggingProgressView()
    }
}
#Preview {
    JoggingProgressView()
}
