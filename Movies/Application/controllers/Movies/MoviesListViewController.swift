//
//  MoviesListViewController.swift
//  Movies
//
//  Created by anderson.jesus.silva on 24/10/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController {

    var presenterInterface: MoviesPresenterInterface!
    var objMovie: [Movie]?
    var totalResult = 0
    var searchController: UISearchController!

    @IBOutlet weak var collection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Movies"
        self.collection.isHidden = true
        self.setupNavBar()
        self.loadSearchVC()
        self.loadXib()
        MoviesWireframe.setUp(vc: self)
        self.showLoading()
        self.presenterInterface.loadMovie()

    }

    private func loadXib() {
        let nib = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        self.collection.register(nib, forCellWithReuseIdentifier: "movieColl")
        self.view.addSubview(self.collection)
    }

    private func loadSearchVC() {
        self.searchController = UISearchController(searchResultsController: nil)
        if #available(iOS 11.0, *) {
            navigationItem.searchController = self.searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        }else{
            navigationItem.titleView = self.searchController.searchBar            
        }
        self.searchController.searchBar.delegate = self
    }
    
    private func setupNavBar() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:
                              UIColor.white]
        
        if #available(iOS 11.0, *) {
            let bar = self.navigationController?.navigationBar
            if #available(iOS 13.0, *) {
                let appearance = UINavigationBarAppearance()
                appearance.largeTitleTextAttributes = textAttributes
                appearance.titleTextAttributes = textAttributes
                appearance.backgroundColor = UIColor.systemOrange
                bar?.scrollEdgeAppearance = appearance
                bar?.standardAppearance   = appearance
                bar?.compactAppearance    = appearance
            }
            bar?.prefersLargeTitles = true
            bar?.largeTitleTextAttributes = textAttributes
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgMovie" {
            if let movieDetailVC: MovieDetailViewController = segue.destination as? MovieDetailViewController,
                let movie = sender as? Movie {
                movieDetailVC.movie = movie
            }
        }
    }
}

extension MoviesListViewController: MoviesPresenterViewInterface {

    func success(movie: [Movie], totalResult: Int) {
        self.objMovie = movie
        self.totalResult = totalResult
        self.collection.isHidden = false
        self.collection.reloadData()
        self.hideLoading()
    }

    func failure(error: String) {
        self.hideLoading()
        self.alertMessage(title: "Movie App", msg: error, btn: "OK")
    }

}

extension MoviesListViewController: UICollectionViewDelegate, UICollectionViewDataSource,
                                    UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.objMovie?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionUsableWidth = collectionView.frame.width - 22
        return CGSize(width: collectionUsableWidth/2, height: collectionUsableWidth/1.2)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {

        guard let obj = self.objMovie else { return }
        self.presenterInterface.loadPagination(indexPath: indexPath,
                                               totalResult: self.totalResult,
                                               movie: obj)

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let obj = self.objMovie {
            self.performSegue(withIdentifier: "sgMovie", sender: obj[indexPath.row])
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let obj = self.objMovie,
              let cell = self.collection.dequeueReusableCell(withReuseIdentifier: "movieColl",
                                                             for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.setup(movie: obj[indexPath.row])
        return cell
    }

}

extension MoviesListViewController: UISearchBarDelegate {

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchController.searchBar.returnKeyType = .done
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchController.searchBar.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchController.searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchController.searchBar.resignFirstResponder()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let movies = self.objMovie {
            self.presenterInterface.getSearch(movies: movies, searchText: searchText)
        }
    }

}
