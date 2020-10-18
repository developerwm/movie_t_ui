//
//  Network.swift
//  movie_t_ui
//
//  Created by Tauã on 18/10/20.
//

import Alamofire
import Foundation
import Combine

class NetworkManager: ObservableObject {
    @Published var movies = MovieList(results: [])
    @Published var loading = false
    private let api_key = "c5850ed73901b8d268d0898a8a9d8bff"
    private let api_url_base = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key="
    
    init() {
        loading = true
        loadData()
    }
    
    private func loadDatalocally() {
        guard let url = URL(string: "\(api_url_base)\(api_key)") else { return }
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else { return }
            let movies = try! JSONDecoder().decode(MovieList.self, from: data)
            DispatchQueue.main.async {
                self.movies = movies
                self.loading = false
            }
        }.resume()
    }
    
    private func loadData() {
        AF.request("\(api_url_base)\(api_key)")
            .responseJSON{ response in
                guard let data = response.data else { return }
                let movies = try! JSONDecoder().decode(MovieList.self, from: data)
                DispatchQueue.main.async {
                    self.movies = movies
                    self.loading = false
                }
        }
    }
}
