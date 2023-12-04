//
//  LiveScoreCartIemView.swift
//  MovieApp
//
//  Created by Hologram1 on 11/29/23.
//

import SwiftUI

struct LiveScoreCartIemView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(spacing: 2) {
                Text("LIVE")
                    .foregroundColor(Color.red)
                
                Circle()
                    .frame(width: 2, height: 2)
                
                Text("1st TEST")
                Circle()
                    .frame(width: 2, height: 2)
                Text("Sylhet")
                
            }.font(.system(size: 10, weight: .bold))
                
            
            VStack(spacing: 6) {
                HStack {
                    Text("BAN")
                    Spacer()
                    Text("310")
                }
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(Color(.systemGray2))
                HStack {
                    HStack(spacing: 2) {
                        Text("NZ")
                        
                        Circle()
                            .foregroundColor(Color.red)
                            .frame(width: 6, height: 6)
                    }
                    Spacer()
                    HStack(alignment: .bottom, spacing: 0) {
                        Text("(52 ov)")
                            .font(.footnote)
                        Text("168/4")
                    }
                }.font(.system(size: 14, weight: .bold))
                
            }
            
            
            HStack {
             Text("Day 2 - Session 2: New Zeland trail by 142 runs.")
             .foregroundColor(Color.white)
            }
            .font(.system(size: 10 , weight: .semibold))
            
            
           Divider()
           .foregroundColor(Color.white)
           
            CurrentMatchList(items: [
            .init(title: "Schedule"),
            .init(title: "Report"),
            .init(title: "Series")
            
            ], selected: .constant(.matches4), showAllBold: true, paddingSize: .zero)
        }
    }
}

struct LiveScoreCartIemView_Previews: PreviewProvider {
    static var previews: some View {
        LiveScoreCartIemView()
        .preferredColorScheme(.dark)
    }
}
