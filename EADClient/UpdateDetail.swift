//
//  UpdateDetail.swift
//  EADClient
//
//  Created by Marcello Gonzatto Birkan on 16/02/24.
//

import SwiftUI

struct UpdateDetail: View {
  var update: Update = updateData[1]
  
    var body: some View {
      List {
        VStack {
          update.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
          Text(update.text)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationTitle(update.title)
      }
      .listStyle(.plain)
    }
}

#Preview {
    UpdateDetail()
}
