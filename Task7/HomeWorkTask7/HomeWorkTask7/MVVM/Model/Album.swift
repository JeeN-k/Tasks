//
//  Album.swift
//  HomeWorkTask7
//
//  Created by Oleg Stepanov on 14.03.2022.
//

import Foundation

struct AlbumResponse: Decodable {
    var data: [Album]
}

struct Album: Decodable {
    var id: Int
    var title: String
    var coverMedium: String
    var artist: Artist
}

struct Artist: Decodable {
    var name: String
}
