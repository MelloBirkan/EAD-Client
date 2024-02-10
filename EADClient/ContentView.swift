//
//  ContentView.swift
//  EADClient
//
//  Created by Marcello Gonzatto Birkan on 10/02/24.
//

import SwiftUI

struct ContentView: View {
  @State private var isPresentating: Bool = true
  @State private var show = false
  @State private var viewState = CGSize.zero
  
  var body: some View {
    ZStack {
      // MARK: Title & background image
      TitleView()
        .blur(radius: show ? 20 : 0)
        .animation(.default, value: show)
      
      // MARK: Background Card
      BackCardView()
        .background(show ? Color.card3 : Color.card4)
        .cornerRadius(20)
        .shadow(radius: 20)
        .offset(x:0, y: show ? -400 : -40)
        .offset(x: viewState.width, y: viewState.height)
        .scaleEffect(0.9)
        .rotationEffect(.degrees(show ? 0 : 10))
        .rotation3DEffect(.degrees(10), axis: (x: 10.0, y: 0.0, z: 0.0))
        .blendMode(.hardLight)
        .animation(.easeInOut(duration: 0.4), value: show)
      
      BackCardView()
        .background(show ? Color.card4 : Color.card3)
        .cornerRadius(20)
        .shadow(radius: 20)
        .offset(x:0, y: show ? -200 : -20)
        .offset(x: viewState.width, y: viewState.height)
        .scaleEffect(0.95)
        .rotationEffect(Angle(degrees: show ? 0 : 5))
        .rotation3DEffect(.degrees(5), axis: (x: 10.0, y: 0.0, z: 0.0))
        .blendMode(.hardLight)
        .animation(.easeInOut(duration: 0.3), value: show)
      
      // MARK: Front Card
      CardView()
        .offset(x: viewState.width, y: viewState.height)
        .blendMode(.hardLight)
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: viewState)
        .onTapGesture {
          show.toggle()
        }
        .gesture(
          DragGesture().onChanged { value in
            viewState = value.translation
            show = true
          }
            .onEnded({ value in
              viewState = .zero
              show = false
            })
        )
        
      // MARK: Bottom Card (Bottom Sheet)
          BottomCardView()
        .blur(radius: show ? 20 : 0)
        .animation(.default, value: show)
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
      Rectangle()
        .frame(width: 40, height: 5)
        .cornerRadius(3)
        .opacity(0.1)
      Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
        .multilineTextAlignment(.center)
        .font(.subheadline)
        .lineSpacing(4)
      Spacer()
    }
    .padding(.top, 8)
    .padding(.horizontal, 20)
    .frame(maxWidth: .infinity)
    .background(Color.white)
    .cornerRadius(30)
    .shadow(radius: 20)
    .offset(x: 0, y: 540)
  }
}
