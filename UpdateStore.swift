//
//  UpdateStore.swift
//  EADClient
//
//  Created by Marcello Gonzatto Birkan on 16/02/24.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
  @Published var updates: [Update] = updateData
}
