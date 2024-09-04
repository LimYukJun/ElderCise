//
//  WarmUpView.swift
//  Project2_4am
//
//  Created by Ted Tan on 27/7/24.
//

import SwiftUI


struct WarmUpView: View {
    
    @State private var done = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                List {
                    Section(header: Text(" "), footer: Text("Do warm ups before you start exercising")) {
                        
                        HStack{
                            Text("Lunges")
                            Spacer()
                            Text("Lunges 5 times each leg")
                        }
                        
                        HStack{
                            Text("Sidesteps")
                            Spacer()
                            Text("Step to each side 20 times")
                        }
                        
                        HStack{
                            Text("Squats")
                            Spacer()
                            Text("Squat down 15 times")
                        }
                    }
                }        .navigationTitle("Warm Up")
                
                Button{
                    dismiss()
                } label: {
                    Text("Done with Warmup")
                        .padding()
                        .background(Color(.blue))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                    
                }
            }
        }
    }



#Preview {
    WarmUpView()
}


