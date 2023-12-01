//
//  Header.swift
//  MovieApp
//
//  Created by Hologram1 on 11/29/23.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
          MenuIcon()
          .frame(width: 22)
          
          Image("logo")
          .resizable()
         .scaledToFit()
         .frame(width: 150)
          Spacer()
          
          Text("Use App")
          .font(.footnote)
          .foregroundColor(Color.black)
          .fontWeight(.semibold)
          .padding(.horizontal, 12)
          .padding(.vertical, 6)
          .background(Capsule())
        .padding(.trailing, 8)
        
        Image(systemName: "gearshape")
        .resizable()
        .scaledToFit()
        .frame(width: 24, height: 24)
        
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
        .preferredColorScheme(.dark)
    }
}
