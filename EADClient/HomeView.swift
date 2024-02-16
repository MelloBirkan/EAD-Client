//
//  HomeView.swift
//  EADClient
//
//  Created by Marcello Gonzatto Birkan on 13/02/24.
//

import SwiftUI

struct HomeView: View {
  @Binding var showProfile: Bool
  @State var showUpdate = false
  
    var body: some View {
      VStack {
        HStack {
          Text("Watching")
            .font(.system(size: 28, weight: .bold))
          
          Spacer()
          
          AvatarView(showProfile: $showProfile)
          
          Button(action: {
            showUpdate.toggle()
          }) {
            Image(systemName: "bell")
              .renderingMode(.template)
              .font(.system(size: 16, weight: .medium))
              .frame(width: 36, height: 36)
              .background(Color.white)
              .clipShape(Circle())
              .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
              .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
          }
          .sheet(isPresented: $showUpdate) {
            UpdateList()
          }
        }
        .padding(.horizontal)
        .padding(.leading, 14)
        .padding(.top, 30)
        
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 20) {
            ForEach(sectionData) { item in
              GeometryReader { geometry in
                SectionView(section: item)
                  .rotation3DEffect(Angle(degrees: geometry.frame(in: .global).minX - 30) / -20, axis: (x: 00, y: 10, z: 0))
              }
              .frame(width: 275, height: 275)
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
  var section: Section
  
  var body: some View {
    VStack {
      HStack {
        Text(section.title)
          .font(.system(size: 24, weight: .bold))
          .frame(width: 160, alignment: .leading)
          .foregroundStyle(.white)
        Spacer()
        section.logo
      }
      Text(section.text.uppercased())
        .frame(maxWidth: .infinity, alignment: .leading)
      section.image
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 210)
    }
    .padding(.top, 20)
    .padding(.horizontal, 20)
    .frame(width: 275, height: 275)
    .background(section.color)
    .clipShape(RoundedRectangle(cornerRadius: 30))
    .shadow(color: section.color.opacity(0.3), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 20)
  }
}

struct Section: Identifiable {
  var id = UUID()
  var title: String
  var text: String
  var logo: Image
  var image: Image
  var color: Color
}

let sectionData = [
  Section(title: "Prototype designs in SwiftUI", text: "18 Sections", logo: Image(.logo2), image: Image(.card2), color: Color.card2),
  Section(title: "Build a SwiftUI App", text: "21 Sections", logo: Image(.logo1), image: Image(.card1), color: Color.card1),
  Section(title: "Build a React App", text: "17 Sections", logo: Image(.logo3), image: Image(.card3), color: Color.card3),
]


