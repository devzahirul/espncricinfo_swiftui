//
//  LiveScoreCartList.swift
//  MovieApp
//
//  Created by Hologram1 on 11/29/23.
//

import SwiftUI

struct LiveScoreCartList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
              ForEach(1...5, id: \.self) {option in
               LiveScoreCartIemView()
               .padding()
               .background(Color("cartbg"))
               .clipShape(RoundedRectangle(cornerRadius: 12))
              }
            }.padding(.horizontal)
        }
    }
}

struct LiveScoreCartList_Previews: PreviewProvider {
    static var previews: some View {
        LiveScoreCartList()
    }
}
