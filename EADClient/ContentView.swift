//
//  ContentView.swift
//  EADClient
//
//  Created by Marcello Gonzatto Birkan on 10/02/24.
//

import SwiftUI

struct ContentView: View {
  @State private var showCard: Bool = false
  @State private var show = false
  @State private var viewState = CGSize.zero
  
  var body: some View {
    ZStack {
      // MARK: Title & background image
      TitleView()
        .blur(radius: show ? 20 : 0)
        .opacity(showCard ? 0.4 : 1)
        .offset(y: showCard ? -100 : 0)
        .animation(Animation
          .default
          .delay(0.1)
//          .speed(2)
//          .repeatForever()
                   , value: showCard)
        .animation(.easeInOut, value: viewState)
      
      // MARK: Background Card
      BackCardView()
        .frame(width: showCard ? 300 : 340, height: 220)
        .background(show ? Color.card3 : Color.card4)
        .cornerRadius(20)
        .shadow(radius: 20)
        .offset(x:0, y: show ? -400 : -40)
        .offset(x: viewState.width, y: viewState.height)
        .offset(y: showCard ? -180 : 0)
        .scaleEffect(showCard ? 1 : 0.9)
        .rotationEffect(.degrees(show ? 0 : 10))
        .rotationEffect(Angle(degrees: showCard ? -10 : 0))
        .rotation3DEffect(.degrees(showCard ? 0 : 10), axis: (x: 10.0, y: 0.0, z: 0.0))
        .blendMode(.hardLight)
        .animation(.easeInOut(duration: 0.4), value: [show, showCard])
      
      BackCardView()
        .frame(width: 340, height: 220)
        .background(show ? Color.card4 : Color.card3)
        .cornerRadius(20)
        .shadow(radius: 20)
        .offset(x:0, y: show ? -200 : -20)
        .offset(x: viewState.width, y: viewState.height)
        .offset(y: showCard ? -140 : 0)
        .scaleEffect(showCard ? 1 : 0.95)
        .rotationEffect(Angle(degrees: show ? 0 : 5))
        .rotationEffect(Angle(degrees: showCard ? -5 : 0))
        .rotation3DEffect(.degrees(showCard ? 0 : 5), axis: (x: 10.0, y: 0.0, z: 0.0))
        .blendMode(.hardLight)
        .animation(.easeInOut(duration: 0.4), value: [show, showCard])
      
      // MARK: Front Card
      CardView()
        .frame(width: showCard ? 375 : 340, height: 220)
        .background(Color.black)
//        .cornerRadius(20)
        .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
        .shadow(radius: 20)
        .offset(x: viewState.width, y: viewState.height)
        .offset(y: showCard ? -100 : 0)
        .blendMode(.hardLight)
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: [ showCard])
        .onTapGesture {
          showCard.toggle()
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
      // MARK: Bottom Card (Bottom Sheet)
               .sheet(isPresented: $showCard) {
                 BottomCardView()
               }
//        .blur(radius: show ? 20 : 0)
//        .animation(.default, value: show)
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
    
  }
}

struct BackCardView: View {
  var body: some View {
    VStack {
      Spacer()
    }
    
    
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
     .presentationDetents([.fraction(0.45), .large])
     .presentationDragIndicator(.visible)
//     .interactiveDismissDisabled(true)
   }
 }
