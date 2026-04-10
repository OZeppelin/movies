//
//  MovieBase.swift
//  Movies
//
//  Created by anderson.jesus.silva on 24/10/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import Foundation
import Alamofire

struct MovieBase: Codable {
    let page, totalResults, totalPages: Int
    let results: [Movie]

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results = "results"
    }
}
