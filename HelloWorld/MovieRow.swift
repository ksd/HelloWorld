//
//  MovieRow.swift
//  HelloWorld
//
//  Created by ksd on 04/02/2025.
//

import SwiftUI

struct MovieRow: View {
    var movie: Movie

    init(for movie: Movie){
        self.movie = movie
    }

    var body: some View {
        ZStack(alignment: .top) {
            Image(movie.poster)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .shadow(color: .gray, radius: 10, x: 5, y: 5)
            Color.black
                .opacity(0.3)
                .frame(width: .infinity, height: 80.0)
            Text(movie.title)
                .font(.largeTitle)
                .lineLimit(1)
                .bold()
                .foregroundStyle(.white)
                .padding()
        }
        .cornerRadius(20)
    }
}

#Preview("Portrait", traits: .portrait) {
    MovieRow(for: MovieController().movies.first!)
}
