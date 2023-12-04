//
//  CurrentMatchList.swift
//  MovieApp
//
//  Created by Hologram1 on 11/29/23.
//

import SwiftUI

struct CurrentMatchList: View {
   let items: [MatchItem]
   
   @Binding var selected: MatchItem
   var showAllBold: Bool = false
   var paddingSize: CGFloat = 20
   
  var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: paddingSize == .zero ? 16 : .zero) {
            ForEach(items, id: \.title) { item in
              CurrentMatchItemView(matchItem: MatchItem(title: item.title), isSelected: showAllBold ? true : selected.title == item.title)
              .padding(.leading, paddingSize)
                    .onTapGesture {
                        selected = item
                    }
              }
            }
        }
    }
}

struct CurrentMatchList_Previews: PreviewProvider {
    static var previews: some View {
        CurrentMatchList(items: [MatchItem.matches], selected: .constant(.matches))
        .preferredColorScheme(.dark)
    }
}
