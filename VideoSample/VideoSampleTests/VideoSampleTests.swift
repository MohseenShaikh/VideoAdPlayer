//
//  VideoSampleTests.swift
//  VideoSampleTests
//
//  Created by Mohseen Shaikh on 30/06/19.
//  Copyright © 2019 Mohseen. All rights reserved.
//

import XCTest
@testable import VideoSample

class VideoSampleTests: XCTestCase {

    /// Subject Under test.
    var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        
        sut = ViewController()
    }

    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }

    func test_IntialPlayer_ShouldBeNil() {
        /// Given
        /// When
        sut = ViewController()
        
        /// Then
        XCTAssertNil(sut.player)
        
    }
    
    func test_LoadSingleMovie_PlayerSetsUp() {
        /// Given
        sut = ViewController()
        
        /// When
        let movie = Movie(id: "unique_01",
                          name: "Funny Bunny",
                          url: BusinessConstants.StreamURL.url1,
                          tag: nil)
        sut.setupPlayer(with: movie)
        
        /// Then
        XCTAssertNotNil(sut.player)
    }

}
