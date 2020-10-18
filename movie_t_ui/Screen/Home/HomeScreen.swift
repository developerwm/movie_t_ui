//
//  HomeScreen.swift
//  movie_t_ui
//
//  Created by Tauã on 18/10/20.
//

import Foundation
import SwiftUI

struct HomeScreen : View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            VStack {
                if networkManager.loading {
                    Text("Loading ...")
                } else {
                    List(networkManager.movies.results) { movie in
                        NavigationLink(destination: MovieDetailScreen(movie: movie)){
                            MovieRow(movie: movie)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Movies"))
        }
    }
}

#if DEBUG
struct HomeScreen_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
