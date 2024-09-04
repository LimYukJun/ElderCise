//
//  OnboardingView.swift
//  Project2_4am
//
//  Created by T Krobot on 27/7/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var gender: String = ""
    @State private var activityLevel: String = ""
    @State private var age: String = ""
    @State private var showAgeDisclaimer: Bool = false
    @State private var selectedGender = ""
        let genderOptions = ["Male", "Female", "Non-Binary"]
    @State private var selectedActivtyLevel = ""
        let activityLevelOptions = ["Light", "Moderate", "Intensive"]
    @State private var selectedAge = ""
        let ageOptions = ["50-55", "56-60", "61-65", "66-70", "71-75", "76-80", "81-85", "86-90", "90+"]
    
    let textLimit = 6
    
    
    var body: some View {

        NavigationStack{
            
                List{
                    Section{
                        HStack{
                            TextField("Height", text: $height)
                                .keyboardType(.decimalPad)
                                .onChange(of: height) {
                                    self.height = String(height.prefix(textLimit))
                                }
                                .onChange(of: height, { oldValue, newValue in
                                    if newValue != "" && Double(newValue) == nil {
                                        height = oldValue
                                    }
                                })
                                .lineLimit(1)
                            
                            Text("cm")
                        }
                        
                        HStack{
                            TextField("Weight", text: $weight)
                                .keyboardType(.decimalPad)
                                .onChange(of: weight) {
                                    self.weight = String(weight.prefix(textLimit))
                                }
                                .onChange(of: weight, { oldValue, newValue in
                                    if newValue != "" && Double(newValue) == nil {
                                        weight = oldValue
                                    }
                                })
                                .lineLimit(1)
                            
                            Text("kg")
                        }
                        Picker("Gender", selection: $selectedGender) {
                            ForEach(genderOptions, id: \.self) {
                                Text($0)
                            }
                        }
                        Picker("Activity Level", selection: $selectedActivtyLevel) {
                            ForEach(activityLevelOptions, id: \.self) {
                                Text($0)
                            }
                        }
                        Picker("Age", selection: $selectedAge) {
                            ForEach(ageOptions, id: \.self) {
                                Text($0)
                            }
                        }
                        .onChange(of: selectedAge) { oldValue, newValue in
                            showAgeDisclaimer = ["86-90", "90+"].contains(newValue)
                        }
                        if showAgeDisclaimer {
                            Text("Please exercise carefully and stop immediately if you feel uncomfortable.")
                                .font(.footnote)
                                .foregroundColor(.red)
                                .padding(.top, 5)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }header: {
                        Text("Please enter your personal information:")
                            .font(.subheadline)
                            .textCase(nil)
                    }
                    Section {
                        Button(action: {
                        }) {
                            Text("Submit")
                                .frame(maxWidth: .infinity)
                            
                                .foregroundColor(.blue)
                                .cornerRadius(10)
                            
                        }.buttonStyle(BorderlessButtonStyle())
                        
                    }footer:{
                        Text("or")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity)
                            .padding(.top,20)
                    }
                    
                    Section {
                        
                        Button(action: {
                        }) {
                            Text("Continue with Health")
                                .frame(maxWidth: .infinity)
                                
                                .foregroundColor(.blue)
                                .cornerRadius(10)
                        }.buttonStyle(BorderlessButtonStyle())
                    }
                    
                }
            .navigationTitle("Onboarding")
        }
    }
}


#Preview {
    OnboardingView()
}

