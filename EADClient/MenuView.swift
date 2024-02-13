//
//  MenuView.swift
//  EADClient
//
//  Created by Marcello Gonzatto Birkan on 12/02/24.
//

import SwiftUI

struct MenuView: View {
  var body: some View {
    VStack {
      Spacer()
      
      VStack(spacing: 16) {
        Text("Mello - 28% complete")
          .font(.caption)
        
        Color.white
          .frame(width: 38, height: 6)
          .cornerRadius(3)
          .frame(width: 130, height: 6, alignment: .leading)
          .background(Color.black.opacity(0.08))
          .cornerRadius(3)
          .padding()
          .frame(width: 150, height: 24)
          .background(Color.black.opacity(0.1))
          .cornerRadius(12)
        
        MenuRow(title: "Account", icon: "gear")
        MenuRow(title: "Billing", icon: "creditcard")
        MenuRow(title: "Sign out", icon: "person.crop.circle")
      }
      .frame(maxWidth: .infinity)
      .frame(height: 300)
      .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color(#colorLiteral(red: 0.8954151273, green: 0.9160741568, blue: 0.9564130902, alpha: 1))]), startPoint: .top, endPoint: .bottom))
      .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
      .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
    .padding(.horizontal, 30)
    .overlay(
      Image("Avatar")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 60, height: 60)
        .clipShape(Circle())
        .offset(y: -150)
        
    )
    }
    .padding(.bottom, 30)
  }
}

#Preview {
  MenuView()
}

struct MenuRow: View {
  var title: String
  var icon: String
  
  var body: some View {
    HStack(spacing: 16) {
      Image(systemName: icon)
        .font(.system(size: 20, weight: .light))
        .imageScale(.large)
        .frame(width: 32, height: 32)
        .foregroundStyle(Color.sfSymbolsCard)
      Text(title)
        .font(.system(size: 20, weight: .bold, design: .default))
        .frame(width: 120, alignment: .leading)
    }
  }
}
