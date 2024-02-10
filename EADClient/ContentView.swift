//
//  ContentView.swift
//  EADClient
//
//  Created by Marcello Gonzatto Birkan on 10/02/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      // MARK: Background Card
      BackCardView()
        .background(Color.card4)
        .cornerRadius(20)
        .shadow(radius: 20)
        .offset(x:0, y: -40)
        .scaleEffect(0.9)
        .rotationEffect(.degrees(10))
        .rotation3DEffect(.degrees(10), axis: (x: 10.0, y: 0.0, z: 0.0))
        .blendMode(.hardLight)
      
      
      BackCardView()
        .background(Color.card3)
        .cornerRadius(20)
        .shadow(radius: 20)
        .offset(x:0, y: -20)
        .scaleEffect(0.95)
        .rotationEffect(Angle(degrees: 5))
        .rotation3DEffect(.degrees(5), axis: (x: 10.0, y: 0.0, z: 0.0))
        .blendMode(.hardLight)
      
      // MARK: Front Card
      CardView()
        .blendMode(.hardLight)
      
    }
  }
}

#Preview {
  ContentView()
}

struct CardView: View {
  var body: some View {
    VStack {
      HStack {
        VStack {
          Text("UI Design")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
          Text("Certificate")
            .foregroundColor(Color("AccentColor"))
        }
        Spacer()
        Image("Logo1")
      }
      .padding(.horizontal, 20)
      .padding(.top, 20)
      Spacer()
      Image("Card1")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 300, height: 110, alignment: .top)
    }
    .frame(width: 340, height: 220)
    .background(Color.black)
    .cornerRadius(20)
    .shadow(radius: 20)
  }
}

struct BackCardView: View {
  var body: some View {
    VStack {
      Spacer()
    }
    .frame(width: 340, height: 220)
    
  }
}
