//
//  MusicFetchingService.swift
//  HomeWorkTask7
//
//  Created by Oleg Stepanov on 14.03.2022.
//

import Foundation

protocol MusicNetwork {
    func getChartList(completion: @escaping (([Album]?) -> Void))
    func getAlbumTrackList(albumId: Int, completion: @escaping (([Track]?) -> Void))
}

class MusicFetchingService: MusicNetwork {
    
    let networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func getChartList(completion: @escaping (([Album]?) -> Void)) {
        let params = ["limit" : "10"]
        let api = APIS.albumChartList.getAPI()
        networking.getRequest(api: api, parameters: params) { data, error in
            if let error = error {
                print("Error recieve data \(error.localizedDescription)")
            }
            let response = self.decodeJSON(type: AlbumResponse.self, from: data)
            completion(response?.data)
        }
    }
    
    func getAlbumTrackList(albumId: Int, completion: @escaping (([Track]?) -> Void)) {
        let api = APIS.trackAlbumList(albumId).getAPI()
        networking.getRequest(api: api, parameters: nil) { data, error in
            if let error = error {
                print("Error recieve data \(error.localizedDescription)")
            }
            let response = self.decodeJSON(type: TrackResponse.self, from: data)
            completion(response?.data)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from data: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = data, let response = try? decoder.decode(type.self, from: data) else {
            print("Error JSON response")
            return nil
        }
        return response
    }
}
