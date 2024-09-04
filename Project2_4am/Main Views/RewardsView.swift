//
//  RewardsView.swift
//  Project2_4am
//
//  Created by Yuk Jun Lim on 27/7/24.
//

import SwiftUI

struct RewardsView: View {
    var currentPoints: Int = 670
    var nextRewardPoints: Int = 750
    
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    HStack{
                        Text("Current Points")
                        Spacer()
                        Text("\(currentPoints)")
                    }
                    HStack{
                        Text("Next Reward")
                        Spacer()
                        Text("\(nextRewardPoints)")
                    }
                    Section{
                        HStack {
                            Text("200 pts")
                            Spacer()
                            Text("Voucher of $2 (redeemed)")
                        }
                        HStack {
                            Text("500 pts")
                            Spacer()
                            Text("Voucher of $2.50 (not redeemed)")
                        }
                        HStack {
                            Text("750 pts")
                            Spacer()
                            Text("Voucher of $3.50 (locked)")
                        }
                        HStack {
                            Text("10 000 pts")
                            Spacer()
                            Text("Voucher of $5 (locked)")
                        }
                    }
                    .navigationTitle("Rewards!")
                    
                    Section{
                        Button {
                            
                        } label: {
                            Text("Redeem all avaliable vouchers")
                        }
                        
                    }
                    
                }
            }
        }
    }
}
#Preview {
    RewardsView()
}
