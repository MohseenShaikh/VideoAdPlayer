//
//  ViewController.swift
//  VideoSample
//
//  Created by Mohseen Shaikh on 30/06/19.
//  Copyright © 2019 Mohseen. All rights reserved.
//

import UIKit
import PlayKit
import PlayKit_IMA

class ViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet private weak var playerContainerView: PlayerView!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var playPauseButton: UIButton!
    
    // MARK: Private properties
    
    private var player: Player?
    private let movies = Movie.moviesDataSource()
    private let reusableIdentifier = "movieCell"
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        updatePlayerControls()
    }

    // MARK: - Private functions
    
    /// Sets up tableview
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    /// Sets up the player
    ///
    /// - Parameter movie: A model for movie data.
    private func setupPlayer(with movie: Movie) {
        if let player = self.player {
            player.stop()
            player.destroy()
            self.player = nil
        }
        
        // Look out for the plugin config for ads and without ads movie
        let pluginConfig: PluginConfig?
        if let adTag = movie.tag {
            let adsConfig = IMAConfig()
            adsConfig.adTagUrl = adTag
            pluginConfig = PluginConfig(config: [IMAPlugin.pluginName: adsConfig])
        } else {
            pluginConfig = nil
        }
        
        self.player = PlayKitManager.shared.loadPlayer(pluginConfig: pluginConfig)
        preparePlayer(with: movie)
    }
    
    /// Loads up the player
    ///
    /// - Parameter movie: A model for movie data.
    private func preparePlayer(with movie: Movie) {
        // create media config for player
        let mediaConfig = createMediaConfig(for: movie)
       
        // prepare the player
        guard let player = self.player else {
            assertionFailure("Player has not been loaded")
            return
        }
        
        // Add observer for tracking any error's from player
        self.player?.addObserver(self, event: PlayerEvent.error, block: { (errorEvent) in
            print("error " + (errorEvent.adError?.localizedDescription ?? ""))
        })
        
        // prepare player view
        player.view = playerContainerView
        player.prepare(mediaConfig)
    }
    
    /// Creates a media config for the player
    ///
    /// - Parameter movie: A model for movie data.
    /// - Returns: Media configuration for rendering to a player.
    private func createMediaConfig(for movie: Movie) -> MediaConfig {
        // create media source and initialize a media entry with that source
        let entryId = movie.id
        let contentUrl = movie.url
        let source = PKMediaSource(entryId,
                                   contentUrl: URL(string: contentUrl),
                                   drmData: nil,
                                   mediaFormat: .hls)
        
        // setup media entry
        let mediaEntry = PKMediaEntry(entryId,
                                      sources: [source],
                                      duration: -1)
        
        // return media config
        return MediaConfig(mediaEntry: mediaEntry, startTime: 0)
    }
    
    private func updatePlayerControls() {
        guard self.player != nil else {
            playPauseButton.isHidden = true
            return
        }
        playPauseButton.isHidden = false
    }
    
    // MARK: - Action methods
    
    @IBAction func didClickPlayPause(_ sender: UIButton) {
        guard let player = self.player else {
            assertionFailure("Player unavailable")
            return
        }
        
        if player.isPlaying {
            player.pause()
            sender.setTitle("Play", for: .normal)
        } else {
            player.play()
            sender.setTitle("Pause", for: .normal)
        }
    }
}

// MARK: - UITableViewDataSource methods

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setup(movie: movies[indexPath.item])
        return cell
    }
}

// MARK: - UITableViewDelegate methods

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        setupPlayer(with: movies[indexPath.item])
        player?.play()
        updatePlayerControls()
    }
}
