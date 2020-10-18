//
//  MovieRow.swift
//  movie_t_ui
//
//  Created by Tauã on 18/10/20.
//

import Foundation
import URLImage
import SwiftUI

struct MovieRow : View {
    var movie: Movie
    
    var body: some View {
        
        VStack (alignment: .center) {
            
            VStack (alignment: .center) {
                
                URLImage(URL(string:  "\(BASE_IMAGE_URL)\(movie.poster_path)")!, delay: 0.25)
                { proxy in
                    proxy.image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 90)
                }
                
                Spacer()
                
                HStack (alignment: .center) {
                    
                    Spacer()
                    
                    Text(movie.title)
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .padding(.bottom, 12)
                    
                    Spacer()
                }
    
            }
            .background(Color.white)
            .frame(height: 220)
            .padding(.horizontal, 1)
            .cornerRadius(8)
    
        }
        .cornerRadius(5)
        .padding(.horizontal, 6)
        .padding(.vertical, 4)
    }
}

extension Float {
    func format() -> String {
        return String(format: "%.2f",self)
    }
}

struct MovieRow_Previews : PreviewProvider {
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
