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
  var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
            ForEach(items, id: \.title) { item in
              CurrentMatchItemView(matchItem: MatchItem(title: item.title), isSelected: showAllBold ? true : selected.title == item.title)
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
