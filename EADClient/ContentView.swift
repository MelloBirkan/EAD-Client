//
//  ContentView.swift
//  EADClient
//
//  Created by Marcello Gonzatto Birkan on 10/02/24.
//

import SwiftUI

struct ContentView: View {
  @State private var isPresentating: Bool = true
  var body: some View {
    ZStack {
      // MARK: Title & background image
      TitleView()
        .blur(radius: 20)
      
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
        
      // MARK: Bottom Card (Bottom Sheet)
        .sheet(isPresented: $isPresentating) {
          BottomCardView()
        }
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

struct TitleView: View {
  var body: some View {
    VStack {
      HStack {
        Text("Certificates")
          .font(.largeTitle)
          .bold()
        Spacer()
      }
      .padding()
      Image(.background1)
      Spacer()
    }
  }
}

struct BottomCardView: View {
  var body: some View {
    VStack(spacing: 20) {
      Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
        .multilineTextAlignment(.center)
        .font(.subheadline)
        .lineSpacing(4)
      Spacer() // Para usar o maximo de altura
    }
    .padding(.top, 25)
    .padding(.horizontal, 20)
    .cornerRadius(30)
    .shadow(radius: 20)
    //          .offset(x: 0, y: 500)
    .presentationDetents([.fraction(0.35), .large])
    .presentationDragIndicator(.visible)
    .interactiveDismissDisabled(true)
  }
}
