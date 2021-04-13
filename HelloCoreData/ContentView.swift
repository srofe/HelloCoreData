//
//  ContentView.swift
//  HelloCoreData
//
//  Created by Simon Rofe on 9/4/21.
//

import SwiftUI

struct ContentView: View {
    let manager: CoreDataManager
    @State private var movieName: String = ""

    var body: some View {
        VStack {
            TextField("Enter movie name", text: $movieName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Save") {
                manager.saveMovie(name: movieName)
                print("Movie name: \(movieName)")
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(manager: CoreDataManager.inMemory)
    }
}
