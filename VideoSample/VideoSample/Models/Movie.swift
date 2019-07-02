//
//  Movie.swift
//  VideoSample
//
//  Created by Mohseen Shaikh on 02/07/19.
//  Copyright © 2019 Mohseen. All rights reserved.
//

import Foundation

let url1 = "https://video-dev.github.io/streams/x36xhzz/x36xhzz.m3u8"
let url2 = "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8"
let url3 = "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"
let url4 = "https://mnmedias.api.telequebec.tv/m3u8/29880.m3u8"
let url5 = "http://184.72.239.149/vod/smil:BigBuckBunny.smil/playlist.m3u8"

let promotionalIMATag = "https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostoptimizedpodbumper&cmsid=496&vid=short_onecue&correlator="

//let promotionalIMATag = "https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dlinear&correlator="

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
                      url: url1,
                      tag: nil),
                Movie(id: "unique_02",
                      name: "Structural Architecture (Ads)",
                      url: url2,
                      tag: promotionalIMATag + Date().description),
                Movie(id: "unique_03",
                      name: "Funny Bunny",
                      url: url3,
                      tag: nil),
                Movie(id: "unique_04",
                      name: "Death Metal (Ads)",
                      url: url4,
                      tag: promotionalIMATag + Date().description),
                Movie(id: "unique_05",
                      name: "Funny Bunny",
                      url: url5,
                      tag: nil)
        ]
    }
}


