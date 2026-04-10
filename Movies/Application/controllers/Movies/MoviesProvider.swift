//
//  MoviesProvider.swift
//  Movies
//
//  Created by anderson.jesus.silva on 24/10/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import Foundation
import Alamofire

class MoviesProvider: NSObject {

    func getMovies(page: Int, completion: @escaping(Result<MovieBase>) -> Void) {

        let params = ["api_key": BaseURL.apiKey,
                      "page": page] as [String: Any]

        request(RouterAPI.moviesPopular(param: params))
        .validate(contentType: ["application/json"])
            .responseDecodable { (response: DataResponse<MovieBase>) in
                completion(response.result)
            }
        }

    }
