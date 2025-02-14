//
//  ContentView.swift
//  HelloWorld
//
//  Created by ksd on 04/02/2025.
//

import SwiftUI

enum Scopes {
    case work, personal
}

struct ContentView: View {
    @State private var movies = MovieController().movies

    @State private var searchTerm = ""
//    @State private var searchScope: Scopes = .work

    var body: some View {
        NavigationStack {
            List {
                ForEach(movies) { movie in
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
            if !newValue.isEmpty {
                movies = MovieController().movies.filter { $0.title.contains(newValue)}
            }
        }
/*
        .searchScopes($searchScope, scopes: {
            Text("Work").tag(Scopes.work)
            Text("Personal").tag(Scopes.personal)
        })
*/
    }
    private func deleteTask(at offsets: IndexSet) {
        let movie = movies[offsets.first!]
        if let index = movies.firstIndex(of: movie) {
            movies.remove(at: index)
        }
    }
}

#Preview {
    ContentView()
}
