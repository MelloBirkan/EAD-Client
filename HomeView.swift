//
//  HomeView.swift
//  EADClient
//
//  Created by Marcello Gonzatto Birkan on 13/02/24.
//

import SwiftUI

struct HomeView: View {
  @Binding var showProfile: Bool
  
    var body: some View {
      VStack {
        HStack {
          Text("Watching")
            .font(.system(size: 28, weight: .bold))
          
          Spacer()
          
          AvatarView(showProfile: $showProfile)
        }
        .padding(.horizontal)
        .padding(.top, 30)
        
        Spacer()
      }
    }
}

#Preview {
  HomeView(showProfile: .constant(false))
}
