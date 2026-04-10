//
//  MovieCollectionViewCell.swift
//  Movies
//
//  Created by anderson.jesus.silva on 24/10/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(movie: Movie) {
        if let posterPath = movie.posterPath, let titleMovie = movie.title {
            let urlImage = BaseURL.imgBaseURL + posterPath

            self.imgMovie.kf.indicatorType = .activity
            self.imgMovie.kf.setImage(with: URL(string: urlImage))

            self.titleMovie.text = titleMovie
        }
    }
}
