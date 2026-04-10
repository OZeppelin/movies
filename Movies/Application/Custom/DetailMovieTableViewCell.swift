//
//  DetailMovieTableViewCell.swift
//  Movies
//
//  Created by anderson.jesus.silva on 24/10/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import UIKit
import Kingfisher

class DetailMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var overviewMovie: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setup(movie: Movie) {
        if let posterPath = movie.posterPath, let titleMovie = movie.overview {
            let urlImage = BaseURL.imgBaseURL + posterPath

            self.imgMovie.kf.indicatorType = .activity
            self.imgMovie.kf.setImage(with: URL(string: urlImage))

            self.overviewMovie.text = titleMovie
        }
    }
}
