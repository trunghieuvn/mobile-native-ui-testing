//
//  helloswiftApp.swift
//  helloswift
//
//  Created by MacBook Pro on 11/21/21.
//

import SwiftUI

@main
struct helloswiftApp: App {
    @StateObject var vm = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
