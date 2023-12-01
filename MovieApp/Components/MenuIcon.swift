//
//  MenuIcon.swift
//  MovieApp
//
//  Created by Hologram1 on 11/29/23.
//

import SwiftUI

struct MenuIcon: View {
    var body: some View {
        VStack(spacing: 3) {
         LineView(lineHeight: 3)
         LineView(lineHeight: 3)
         LineView(lineHeight: 3)
        }
    }
}

struct MenuIcon_Previews: PreviewProvider {
    static var previews: some View {
        MenuIcon()
    }
}
