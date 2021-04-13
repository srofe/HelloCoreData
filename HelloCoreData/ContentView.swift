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
    @State private var movies: [Movie] = [Movie]()

    var body: some View {
        VStack {
            TextField("Enter movie name", text: $movieName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Save") {
                manager.saveMovie(name: movieName)
                movies = manager.getAllMovies()
            }
            List(movies, id: \.self) { movie in
                Text(movie.name)
            }
            Spacer()
        }
        .padding()
        .onAppear(perform: {
            movies = manager.getAllMovies()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(manager: CoreDataManager.inMemory)
    }
}
