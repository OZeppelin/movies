//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by anderson.jesus.silva on 24/10/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var tbView: UITableView!

    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let title = movie.title {
            self.title = title
        }
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        }
        self.loadXib()
    }

    private func loadXib() {
        let nib = UINib(nibName: "DetailMovieTableViewCell", bundle: nil)
        self.tbView.register(nib, forCellReuseIdentifier: "detailCell")
        self.view.addSubview(self.tbView)
        self.tbView.rowHeight = UITableView.automaticDimension
    }

}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tbView.dequeueReusableCell(withIdentifier: "detailCell",
                                                      for: indexPath) as? DetailMovieTableViewCell {
            cell.setup(movie: self.movie)
            return cell
        }
        return UITableViewCell()
    }

}
