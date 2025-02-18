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
    @State var navigationPath: [Movie] = []

    var body: some View {
        NavigationStack(path: $navigationPath) {
            List {
                ForEach(movieController.movies) { movie in
                    NavigationLink(value: movie) {
                        MovieRow(for: movie)
                    }
                }
                .onDelete(perform: deleteTask)
            }
            .navigationTitle("Sci-Fy Movies")
            .navigationDestination(for: Movie.self, destination: { movie in
                MovieDetailView(for: movie, navigationPath: $navigationPath)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        navigationPath.append(movieController.movies[2])
                        navigationPath.append(movieController.movies.last!)
                    } label: {
                        Image(systemName: "movieclapper")
                    }
                }
            }

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
