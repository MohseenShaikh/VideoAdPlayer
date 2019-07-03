//
//  MovieTableViewCell.swift
//  VideoSample
//
//  Created by Mohseen Shaikh on 02/07/19.
//  Copyright © 2019 Mohseen. All rights reserved.
//

import UIKit

/// Movie Tableview cell for showing the movies listing.
class MovieTableViewCell: UITableViewCell {

    // MARK: - Properties

    @IBOutlet private weak var thumbnailView: UIImageView!
    @IBOutlet private weak var name: UILabel!
    
    /// Private instance of movie
    private var movie: Movie!
    
    // MARK: - Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - Instance methods
    
    /// Sets up the cell
    ///
    /// - Parameter movie: Movie data
    func setup(movie: Movie) {
        name.text = movie.name
        thumbnailView.image = UIImage(imageLiteralResourceName: "movie_thumbnail")
    }
}
