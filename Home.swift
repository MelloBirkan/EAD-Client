//
//  Home.swift
//  EADClient
//
//  Created by Marcello Gonzatto Birkan on 13/02/24.
//

import SwiftUI

struct Home: View {
  @State private var showProfile = false
  
  var body: some View {
    ZStack {
      Color(#colorLiteral(red: 0.7647058964, green: 0.764705956, blue: 0.7647058964, alpha: 1)).ignoresSafeArea()
      
      VStack {
        HStack {
          Text("Watching")
            .font(.system(size: 28, weight: .bold))
          
          Spacer()
          
          Button(action:{
            showProfile.toggle()
          }) {
            Image(.avatar)
              .renderingMode(.original)
              .resizable()
              .frame(width: 36, height: 36)
              .clipShape(Circle())
          }
        }
        .padding(.horizontal)
        .padding(.top, 30)
        
        Spacer()
      }
      .padding(.top, 44)
      .background(Color.white)
      .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
      .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
      .offset(y: showProfile ? -450 : 0)
      .rotation3DEffect(
        .degrees(showProfile ? -10 : 0), axis: (x: 10.0, y: 0.0, z: 0.0))
      .scaleEffect(showProfile ? 0.90 : 1)
      .animation(.spring(response: 0.5, dampingFraction: 0.6))
      .ignoresSafeArea()
      
      MenuView()
        .offset(y: showProfile ? 0 : 600)
        .animation(.spring(response: 0.5, dampingFraction: 0.6))
    }
  }
}

#Preview {
  Home()
}
