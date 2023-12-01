//
//  LineView.swift
//  MovieApp
//
//  Created by Hologram1 on 11/29/23.
//

import SwiftUI

struct LineView: View {
    let lineHeight: CGFloat
    var body: some View {
       Rectangle()
       .frame(height: lineHeight)
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView(lineHeight: 0.4)
    }
}
