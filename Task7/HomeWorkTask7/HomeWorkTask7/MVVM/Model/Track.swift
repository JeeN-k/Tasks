//
//  Chart.swift
//  HomeWorkTask7
//
//  Created by Oleg Stepanov on 14.03.2022.
//

import Foundation

struct TrackResponse: Decodable {
    var data: [Track]
}

struct Track: Decodable {
    var id: Int
    var title: String
    var rank: Int
    var explicitLyrics: Bool
    var duration: Int
    var artist: Artist
}
