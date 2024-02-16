//
//  UpdateList.swift
//  EADClient
//
//  Created by Marcello Gonzatto Birkan on 16/02/24.
//

import SwiftUI

struct UpdateList: View {
  @ObservedObject var store = UpdateStore()
  
  func addUpdate() {
    store.updates.append(Update(image: Image(.card1), title: "New Item", text: "text", date: "Jan 1"))
  }
  
  var body: some View {
    NavigationView {
      List {
        ForEach(store.updates) { item in
          NavigationLink(destination: UpdateDetail(update: item)) {
            HStack {
              item.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.trailing, 4)
              
              VStack(alignment: .leading, spacing: 8.0) {
                Text(item.title)
                  .font(.system(size: 20, weight: .bold))
                
                Text(item.text)
                  .lineLimit(2)
                  .font(.subheadline)
                  .foregroundStyle(Color.gray)
                
                Text(item.date)
                  .font(.caption)
                  .bold()
                  .foregroundStyle(.secondary)
              }
            }
            .padding(.vertical, 8)
          }
        }
        .onDelete { index in
          store.updates.remove(at: index.first!)
        }
        .onMove(perform: { indices, newOffset in
          store.updates.move(fromOffsets: indices, toOffset: newOffset)
        })
      }
      .listStyle(.plain)
      .navigationBarTitle(Text("Updates"))
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button(action: addUpdate) {
            Text("Add Update")
          }
        }
        ToolbarItem(placement: .topBarTrailing) {
          EditButton()
        }
      }
    }
  }
}

#Preview {
  UpdateList()
}

struct Update: Identifiable {
  var id = UUID()
  var image: Image
  var title: String
  var text: String
  var date: String
}

let updateData = [
  Update(image: Image(.card1), title: "SwiftUI Advanced", text: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.", date: "JAN 1"),
  Update(image: Image(.card2), title: "Webflow", text: "Design and animate a high converting landing page with advanced interactions, payments and CMS", date: "OCT 17"),
  Update(image: Image(.card3), title: "ProtoPie", text: "Quickly prototype advanced animations and interactions for mobile and Web.", date: "AUG 27"),
  Update(image: Image(.card4), title: "SwiftUI", text: "Learn how to code custom UIs, animations, gestures and components in Xcode 11", date: "JUNE 26"),
  Update(image: Image(.card5), title: "Framer Playground", text: "Create powerful animations and interactions with the Framer X code editor", date: "JUN 11")
]
