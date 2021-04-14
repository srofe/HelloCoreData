//
//  MovieDetailView.swift
//  HelloCoreData
//
//  Created by Simon Rofe on 14/4/21.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @State private var movieName: String = ""

    var body: some View {
        VStack {
            TextField(movie.name, text: $movieName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Update") {
                if !movieName.isEmpty {
                    movie.name = movieName
                    CoreDataManager.inMemory.updateMovie()
                }
            }
        }
        .onAppear {
            movieName = movie.name
        }
        .padding()
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie(context: CoreDataManager.inMemory.context)
        movie.name = "Lord of the Rings"
        return MovieDetailView(movie: movie)
    }
}
