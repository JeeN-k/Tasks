//
//  APIScheme.swift
//  HomeWorkTask7
//
//  Created by Oleg Stepanov on 14.03.2022.
//

import Foundation

struct APIMusicScheme {
    var scheme: String
    var host: String
    var path: String
    
    init (path: String) {
        self.scheme = "https"
        self.host = "api.deezer.com"
        self.path = path
    }
}

enum APIS {
    case albumChartList
    case trackAlbumList(Int)
    
    func getAPI() -> APIMusicScheme {
        switch self {
        case .albumChartList:
            return APIMusicScheme(path: "/chart/0/albums")
        case .trackAlbumList(let id):
            return APIMusicScheme(path: "/album/\(id)/tracks")
        }
    }
}
