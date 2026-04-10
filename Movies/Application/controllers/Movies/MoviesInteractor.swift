//
//  MoviesInteractor.swift
//  Movies
//
//  Created by anderson.jesus.silva on 24/10/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import Foundation

protocol MoviesInteractorInput: class {
    func getMovie()
    func searchMovies(movies: [Movie], searchText: String)
}

protocol MoviesInteractorOutput: class {
    func resultMovies(movies: [Movie], totalResult: Int)
    func resultMoviesSeach(movies: [Movie])
    func resultError(error: String)
}

class MoviesInteractor: NSObject, MoviesInteractorInput {

    private var pageCurrent: Int = 1
    weak var output: MoviesInteractorOutput?
    
    private lazy var provider: MoviesProvider = {
        return MoviesProvider()
    }()

    func getMovie() {
        self.provider.getMovies(page: pageCurrent, completion: {[weak self] (result) in
            switch result {
            case .success(let movieBase):
                self?.pageCurrent += 1
                self?.output?.resultMovies(movies: movieBase.results, totalResult: movieBase.totalResults)
            case .failure(let error):
                self?.output?.resultError(error: error.localizedDescription)
            }
        })
    }

    func searchMovies(movies: [Movie], searchText: String) {

        var objFiltered: [Movie] = [Movie]()

        objFiltered = movies.filter { (text) -> Bool in
            let tmp: NSString = text.title! as NSString
            let range = tmp.range(of: searchText, options: .caseInsensitive)
            return (range.location != NSNotFound)
        }

        if objFiltered.count > 0 {
            self.output?.resultMoviesSeach(movies: objFiltered)
        }

    }

}
