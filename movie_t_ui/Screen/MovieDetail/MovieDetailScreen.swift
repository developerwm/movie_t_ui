//
//  MovieDetailScreen.swift
//  movie_t_ui
//
//  Created by Tauã on 18/10/20.
//

import Foundation
import SwiftUI
import URLImage

let BASE_IMAGE_URL = "https://image.tmdb.org/t/p/original/"

struct MovieDetailScreen : View {
    var movie: Movie
    
    var body: some View {
        VStack {
            URLImage(URL(string:  "\(BASE_IMAGE_URL)\(movie.poster_path)")!, delay: 0.25) {proxy in
                proxy.image.resizable()
                    .frame(width: UIScreen.main.bounds.height/8*3, height: UIScreen.main.bounds.height/2)
            }
            Text(movie.overview).lineLimit(nil)
            Spacer()
        }.navigationBarTitle(Text(movie.title), displayMode: .inline)
            .padding()
    }
}

struct MovieDetailScreen_Previews : PreviewProvider {
    static var previews: some View {
        MovieRow(movie: Movie(popularity: 1.0,
                              vote_count: 30,
                              id: 4,
                              vote_average: 4.0,
                              title: "title",
                              poster_path: "sss",
                              original_language: "en",
                              original_title: "aa",
                              adult: false,
                              overview: "teste",
                              release_date: "2010")
        )
    }
}

