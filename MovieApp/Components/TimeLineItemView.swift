//
//  TimeLineItemView.swift
//  MovieApp
//
//  Created by Hologram1 on 11/29/23.
//

import SwiftUI

struct TimeLineItemView: View {
    var body: some View {
      VStack {
       Image("profile")
       .resizable()
       .scaledToFit()
       .frame(width: 56, height: 56)
       .clipShape(Circle())
       .padding(6)
       .overlay(
        Circle()
        .stroke(lineWidth: 2)
        .foregroundColor(Color(.white))
       )
       
       Text("43 off 12 balls")
       .foregroundColor(Color.white)
       .font(.system(size: 12))
       .fontWeight(.semibold)
       
       }
    }
}

struct TimeLineItemView_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineItemView()
    }
}
