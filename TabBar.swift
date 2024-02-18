//
//  TabBar.swift
//  EADClient
//
//  Created by Marcello Gonzatto Birkan on 18/02/24.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
      TabView {
        Home().tabItem {
          Image(systemName: "play.circle.fill")
          Text("Home")
        }
        ContentView().tabItem {
          Image(systemName: "rectangle.stack.fill")
          Text("Certificates")
        }
      }
//      .ignoresSafeArea()
    }
}

#Preview {
    TabBar()
}
