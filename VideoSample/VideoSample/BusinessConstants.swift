//
//  BusinessConstants.swift
//  VideoSample
//
//  Created by Mohseen Shaikh on 03/07/19.
//  Copyright © 2019 Mohseen. All rights reserved.
//

import Foundation

/// Business Constants
struct BusinessConstants {
    /// MARK: - Video urls for streaming
    struct StreamURL {
        static let url1 = "https://video-dev.github.io/streams/x36xhzz/x36xhzz.m3u8"
        static let url2 = "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8"
        static let url3 = "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"
        static let url4 = "https://mnmedias.api.telequebec.tv/m3u8/29880.m3u8"
        static let url5 = "http://184.72.239.149/vod/smil:BigBuckBunny.smil/playlist.m3u8"
    }
    
    /// MARK: - IMA tags for playing ads.
    struct IMATag {
        static let promotionalIMATag = "https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostoptimizedpodbumper&cmsid=496&vid=short_onecue&correlator="
    }
}
