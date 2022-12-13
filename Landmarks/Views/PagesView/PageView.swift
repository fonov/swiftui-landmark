//
//  PageView.swift
//  landmark
//
//  Created by Sergei Fonov on 11.12.22.
//

import SwiftUI

struct PageView<Page: View>: View {
  var pages: [Page]
  @State private var currentPage = 0

  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      PageViewController(pages: pages, currentPage: $currentPage)
      PageControl(numberOfPages: pages.count, currentPage: $currentPage)
        .frame(width: CGFloat(pages.count * 18))
        .padding(.trailing)
        .padding(.bottom, 6)
    }
  }
}

struct PageView_Previews: PreviewProvider {
  static var previews: some View {
    PageView(pages: ModelData().futures.map { FeatureCard(landmark: $0) })
      .aspectRatio(3 / 2, contentMode: .fit)
  }
}
