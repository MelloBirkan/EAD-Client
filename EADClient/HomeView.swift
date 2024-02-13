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
        .padding(.leading, 14)
        .padding(.top, 30)
        
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 30) {
            ForEach(0 ..< 3) { item in
              SectionView()
            }
          }
          .padding(30)
          .padding(.bottom, 30)
        }
        
        Spacer()
      }
    }
}

#Preview {
  HomeView(showProfile: .constant(false))
}

struct SectionView: View {
  var body: some View {
    VStack {
      HStack {
        Text("Prototype designs in SwiftUI")
          .font(.system(size: 24, weight: .bold))
          .frame(width: 160, alignment: .leading)
          .foregroundStyle(.white)
        Spacer()
        Image(.logo1)
      }
      Text("18 Sections".uppercased())
        .frame(maxWidth: .infinity, alignment: .leading)
      Image(.card1)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 210)
    }
    .padding(.top, 20)
    .padding(.horizontal, 20)
    .frame(width: 275, height: 275)
    .background(Color.card1)
    .clipShape(RoundedRectangle(cornerRadius: 30))
    .shadow(color: Color.card1.opacity(0.3), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 20)
  }
}
