//
//  RouterAPI.swift
//  Movies
//
//  Created by anderson.jesus.silva on 24/10/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import Alamofire

struct BaseURL {
    static let apiKey: String = "fb8a7aa45890c02d6806f3a56abda32a"
    static let baseURL = "https://api.themoviedb.org/3"
    static let imgBaseURL = "https://image.tmdb.org/t/p/w500"
}

enum RouterAPI: URLRequestConvertible {

    case moviesPopular(param: Parameters)

    var header: HTTPHeaders {
        return ["Content-Type": "application/json"]
    }

    var method: HTTPMethod {
        switch self {
        case .moviesPopular: return .get
        }
    }

    var path: String {
        switch self {
        case .moviesPopular: return "/movie/popular"
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = try BaseURL.baseURL.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .moviesPopular(let params): urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        }
        
        return urlRequest
    }
}
