//
//  DetailView.swift
//  MovieBrowserSwiftUI
//
//  Created by priyatham reddy on 10/23/22.
//

import SwiftUI

struct DetailView: View {
    let movie: Movie
    var baseUrl = "https://image.tmdb.org/t/p/w500"
    var fullURL: URL?{
        guard let path = movie.backdropPath else { return nil}
            let url = baseUrl + path
            return URL(string: url)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(movie.title)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Text("Released Date: \(movie.releaseDate.shortDateFormatter())")
                .font(.subheadline)
                .foregroundColor(.gray)
                
            HStack(alignment: .top, spacing: 5) {
                AsyncImage(url: fullURL) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxHeight: 115)
                } placeholder: {
                    Image(uiImage: UIImage(named: "placeholder")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxHeight: 115)
                    
                        
                }
                ScrollView {
                    Text(movie.overview)
                }
                
                

            }.padding()
            Spacer()
        }
        .toolbarColorScheme(.light, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color(uiColor: .link), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: movie1)
    }
}
