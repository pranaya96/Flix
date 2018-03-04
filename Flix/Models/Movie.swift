//
//  Movie.swift
//  Flix
//
//  Created by Pranaya Adhikari on 2/27/18.
//  Copyright © 2018 Pranaya Adhikari. All rights reserved.
//

import Foundation

class Movie{
    var title: String
    var posterPath: String
    var posterUrl: URL?
    var overview: String
    var releaseDate: String
    var backdropPath:String
    var backdropUrl: URL?
    var movie: Movie!
    
    /*let backdropPathString = movie["backdrop_path"] as! String
    let posterPathString = movie ["poster_path"] as! String
    let baseURLString = "https://image.tmdb.org/t/p/w500"
    let backdropURL = URL(string:baseURLString+backdropPathString)! */
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        overview = dictionary["overview"] as? String ?? "No overview"
        posterPath = dictionary["poster_path"] as! String
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let fullPosterPathUrl = baseUrl+posterPath
        posterUrl = URL(string:fullPosterPathUrl)
        releaseDate = dictionary["release_date"] as! String
        backdropPath = dictionary["backdrop_path"] as! String
        let fullBackdropUrl = baseUrl+backdropPath
        backdropUrl = URL(string:fullBackdropUrl)
        // Set the rest of the properties
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}
