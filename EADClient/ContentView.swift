//
//  ContentView.swift
//  EADClient
//
//  Created by Marcello Gonzatto Birkan on 10/02/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    HStack {
      VStack {
        Text("UI Design")
          .font(.title)
          .fontWeight(.semibold)
        Text("Certificate")
        .foregroundColor(Color("AccentColor"))
      }
      Spacer()
      Image("Logo1")
    }
  }
}

#Preview {
  ContentView()
}
