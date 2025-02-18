//
//  MovieDetailView.swift
//  HelloWorld
//
//  Created by ksd on 18/02/2025.
//

import SwiftUI

struct MovieDetailView: View {

    private var movie: Movie
    @Binding var navigationPath: [Movie]

    init(for movie: Movie, navigationPath: Binding<[Movie]>) {
        self.movie = movie
        _navigationPath = navigationPath
    }

    var body: some View {
        VStack {
            Text(movie.title)
            Button("List movies") {
                navigationPath.removeAll()
            }
        }
    }
}

#Preview {
    MovieDetailView(for: MovieController().movies.first!, navigationPath: Binding.constant([MovieController().movies.first!]))
}
