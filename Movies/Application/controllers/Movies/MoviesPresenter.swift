//
//  MoviesPresenter.swift
//  Movies
//
//  Created by anderson.jesus.silva on 24/10/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import Foundation

protocol MoviesPresenterInterface: class {
    func loadMovie()
    func loadPagination(indexPath: IndexPath, totalResult: Int, movie: [Movie])
    func getSearch(movies: [Movie], searchText: String)
}

protocol MoviesPresenterViewInterface: class {
    func success(movie: [Movie], totalResult: Int)
    func failure(error: String)
}

class MoviesPresenter: NSObject, MoviesPresenterInterface, MoviesInteractorOutput {

    private(set) var interactor: MoviesInteractorInput
    private(set) var wireframe: MoviesWireframe

    weak var viewPresenterInterface: MoviesPresenterViewInterface?

    private var objMovie = [Movie]()

    init(wireframe: MoviesWireframe, interactor: MoviesInteractor) {
        self.wireframe  = wireframe
        self.interactor = interactor
    }

    // MARK: MoviesPresenterInterface
    func loadMovie() {
        self.interactor.getMovie()
    }

    func loadPagination(indexPath: IndexPath, totalResult: Int, movie: [Movie]) {
        if movie.count < totalResult && movie.count - 1 == indexPath.row {
            self.loadMovie()
        }
    }

    func getSearch(movies: [Movie], searchText: String) {
        if searchText.count >= 2 {
            self.interactor.searchMovies(movies: movies, searchText: searchText)
        } else {
            self.loadMovie()
        }
    }

    // MARK: MoviesInteractorOutput
    func resultMovies(movies: [Movie], totalResult: Int) {
        for obj in movies {
            self.objMovie.append(obj)
        }
        self.viewPresenterInterface?.success(movie: self.objMovie, totalResult: totalResult)
    }

    func resultError(error: String) {
        self.viewPresenterInterface?.failure(error: error)
    }

    func resultMoviesSeach(movies: [Movie]) {
        self.viewPresenterInterface?.success(movie: movies, totalResult: movies.count)
    }

}
