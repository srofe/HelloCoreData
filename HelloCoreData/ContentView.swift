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
                movieName = ""
                getMovies()
            }
            List {
                ForEach(movies, id: \.self) { movie in
                    Text(movie.name)
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        let movie = movies[index]
                        manager.delete(movie: movie)
                        getMovies()
                    }
                }
            }
            Spacer()
        }
        .padding()
        .onAppear(perform: {
            getMovies()
        })
    }

    private func getMovies() {
        movies = manager.getAllMovies()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(manager: CoreDataManager.inMemory)
    }
}
