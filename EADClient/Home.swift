//
//  Home.swift
//  EADClient
//
//  Created by Marcello Gonzatto Birkan on 13/02/24.
//

import SwiftUI

struct Home: View {
  @State var showProfile = false
  @State private var viewState = CGSize.zero
  
  var body: some View {
    ZStack {
      Color(#colorLiteral(red: 0.7647058964, green: 0.764705956, blue: 0.7647058964, alpha: 1)).ignoresSafeArea()
      
      HomeView(showProfile: $showProfile)
        .padding(.top, 44)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
        .offset(y: showProfile ? -450 : 0)
        .rotation3DEffect(
          .degrees(showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10.0, y: 0.0, z: 0.0))
        .scaleEffect(showProfile ? 0.90 : 1)
        .animation(.spring(response: 0.5, dampingFraction: 0.6), value: showProfile)
        .ignoresSafeArea()
      
      MenuView()
        .background(Color.black.opacity(0.001))
        .offset(y: showProfile ? 0 : screen.height)
        .offset(y: viewState.height)
        .animation(.spring(response: 0.5, dampingFraction: 0.6), value: showProfile)
        .onTapGesture {
          showProfile.toggle()
        }
        .gesture(
          DragGesture().onChanged { value in
            viewState = value.translation
          }
            .onEnded{ value in
              if viewState.height > 50 {
                showProfile = false
              }
              viewState = .zero
            }
        )
    }
  }
}

#Preview {
  Home()
}

struct AvatarView: View {
  @Binding var showProfile: Bool
  
  var body: some View {
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
}

let screen = UIScreen.main.bounds
