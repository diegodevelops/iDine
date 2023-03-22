//
//  iDineApp.swift
//  iDine
//
//  Created by Diego A. Perez Pares on 12/6/22.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
