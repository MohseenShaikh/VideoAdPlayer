//
//  Movie.swift
//  VideoSample
//
//  Created by Mohseen Shaikh on 02/07/19.
//  Copyright © 2019 Mohseen. All rights reserved.
//

import Foundation

// Movie model for the app.
struct Movie {
    /// Unique Identifier
    let id,
    /// Name for the Movie
        name,
    /// URL stirng for the source
        url: String
    /// Promotional tag for the movie
    let tag: String?
    
    /// Gives the predefined datasource of movie for movies collection.
    static func moviesDataSource() -> [Movie] {
        return [Movie(id: "unique_01",
                      name: "Funny Bunny",
                      url: BusinessConstants.StreamURL.url1,
                      tag: nil),
                Movie(id: "unique_02",
                      name: "Structural Architecture (Ads)",
                      url: BusinessConstants.StreamURL.url2,
                      tag: BusinessConstants.IMATag.promotionalIMATag + Date().description),
                Movie(id: "unique_03",
                      name: "A story of Lost Girl",
                      url: BusinessConstants.StreamURL.url3,
                      tag: nil),
                Movie(id: "unique_04",
                      name: "Death Metal (Ads)",
                      url: BusinessConstants.StreamURL.url4,
                      tag: BusinessConstants.IMATag.promotionalIMATag + Date().description),
                Movie(id: "unique_05",
                      name: "Funny Bunny",
                      url: BusinessConstants.StreamURL.url5,
                      tag: nil)
        ]
    }
}


