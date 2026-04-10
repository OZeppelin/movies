//
//  MoviesWireframe.swift
//  Movies
//
//  Created by anderson.jesus.silva on 24/10/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import Foundation

class MoviesWireframe {

    var presenter: MoviesPresenter?

    static func setUp(vc: MoviesListViewController) {

        let interactor = MoviesInteractor()
        let wireframe  = MoviesWireframe()
        let presenter  = MoviesPresenter(wireframe: wireframe, interactor: interactor)

        vc.presenterInterface = presenter
        interactor.output = presenter
        presenter.viewPresenterInterface = vc

    }

}
