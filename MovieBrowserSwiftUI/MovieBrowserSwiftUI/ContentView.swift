//
//  ContentView.swift
//  MovieBrowserSwiftUI
//
//  Created by priyatham reddy on 10/17/22.
//

import SwiftUI

struct ContentView: View {
   
   @StateObject private var movieVm = MovieViewModel(welcome: Welcome(results: []))
   @State private var searchText = ""
    
   
    var body: some View {
        NavigationStack {
            List(movieVm.welcome.results, id: \.id) { movie in
            
                NavigationLink(value: movie){
                    HStack {
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.largeTitle)
                            Text("\(movie.releaseDate.longDateFormatter())")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .opacity(0.5)
                                
                        }
                        Spacer()
                        Text("\(movie.voteAverage.formatted())")
                    }
                    
                    
                }.navigationDestination(for: Movie.self) { movie in
                    DetailView(movie: movie)
                }
    
               
            }
            .searchable(text: $searchText)
            .onChange(of: searchText) { value in
                Task {
                    if !value.isEmpty {
                        await movieVm.searchWithName(name: value)
                    } else {
                        movieVm.welcome.results.removeAll()
                    }
                    
                }
                
            }
            .navigationTitle("Movie search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.light, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color(uiColor: .link), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)

            
        
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
