//
//  CurrentMatchItemView.swift
//  MovieApp
//
//  Created by Hologram1 on 11/29/23.
//

import SwiftUI

struct MatchItem {
 let title: String
}

extension MatchItem {
 static let matches = MatchItem(title: "Matches(8)")
 static let matches1 = MatchItem(title: "BAN v NZ(1)")
 static let matches2 = MatchItem(title: "WBBL 2023(81)")
 static let matches3 = MatchItem(title: "IND v ENG(1)")
 static let matches4 = MatchItem(title: "Abu Dhabi T10(3)")
}


struct CurrentMatchItemView: View {
    let matchItem: MatchItem
    let isSelected: Bool
    var body: some View {
        Text(matchItem.title)
        .font(.system(size: 14))
        .fontWeight(isSelected ? .semibold : .regular)
    }
}

struct CurrentMatchItemView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentMatchItemView(matchItem: .init(title: "Matches(8)"), isSelected: true)
        .preferredColorScheme(.dark)
    }
}
