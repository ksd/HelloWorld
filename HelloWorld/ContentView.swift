//
//  ContentView.swift
//  HelloWorld
//
//  Created by ksd on 04/02/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(MovieController.self) private var movieController: MovieController

    @State private var searchTerm = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(movieController.movies) { movie in
                    MovieRow(for: movie)
                }
                .onDelete(perform: deleteTask)
            }
            .navigationTitle("Sci-Fy Movies")
        }

        .searchable(
            text:$searchTerm,
            placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Søg film")
        )
        .onChange(of: searchTerm) { oldValue, newValue in
            print("searchTerms: \(oldValue), \(newValue)")
            if newValue.isEmpty {
                
            }
           // movies = .movies.filter { $0.title.contains(newValue)}
        }
    }
    private func deleteTask(at offsets: IndexSet) {
        let movie = movieController.movies[offsets.first!]
        movieController.delete(movie: movie)
    }
}

#Preview {
    ContentView().environment(MovieController())
}
