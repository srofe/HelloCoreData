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
    @State private var needsRefresh: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter movie name", text: $movieName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save") {
                    manager.save(name: movieName)
                    movieName = ""
                    getMovies()
                }
                List {
                    ForEach(movies, id: \.self) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie, refresh: $needsRefresh)) {
                            Text(movie.name)
                        }
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let movie = movies[index]
                            manager.delete(movie: movie)
                            getMovies()
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Movies")
                .accentColor(needsRefresh ? .accentColor : .accentColor)
                Spacer()
            }
            .padding()
            .onAppear(perform: {
                getMovies()
            })
        }
    }

    private func getMovies() {
        movies = manager.movies
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(manager: CoreDataManager.inMemory)
    }
}
