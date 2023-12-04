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
            HStack(spacing: .zero) {
              ForEach(1...5, id: \.self) {option in
               LiveScoreCartIemView()
               .padding(8)
               .background(Color("cartbg"))
               .clipShape(RoundedRectangle(cornerRadius: 12))
               .padding(.leading, 6)
               .frame(width: 320)
              }
            }
        }
    }
}

struct LiveScoreCartList_Previews: PreviewProvider {
    static var previews: some View {
        LiveScoreCartList()
    }
}
