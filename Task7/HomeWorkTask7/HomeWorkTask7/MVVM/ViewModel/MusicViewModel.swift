//
//  MusicViewModel.swift
//  HomeWorkTask7
//
//  Created by Oleg Stepanov on 14.03.2022.
//

import Foundation

final class MusicViewModel {
    
    var albumSections: [SectionModel] = []
    let network: Networking
    let musicNetwork: MusicNetwork
    
    init() {
        network = NetworkService()
        musicNetwork = MusicFetchingService(networking: network)
    }
    
    func fetchAlbums(completion: @escaping(() -> Void)) {
        musicNetwork.getChartList { [weak self] albums in
            guard let self = self, let albums = albums else { return }
            var albumsModel: [SectionModel] = albums.map({ SectionModel(album: $0, albumTracks: []) })
            self.fetchTracks(albums: albums) { tracks, index in
                albumsModel[index].albumTracks = tracks
                self.albumSections = albumsModel
                completion()
            }
        }
    }
    
    private func fetchTracks(albums: [Album], completion: @escaping(([Track], Int) -> Void)) {
        for i in 0 ..< albums.count {
            self.musicNetwork.getAlbumTrackList(albumId: albums[i].id) { tracks in
                guard let tracks = tracks else { return }
                completion(tracks, i)
            }
        }
    }
    
    func expandSection(section: Int, completion: @escaping((Int) -> Void)) {
        albumSections[section].isExpanded = !albumSections[section].isExpanded
        let tracks = albumSections[section].albumTracks
        completion(tracks.count)
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MusicCellViewModel? {
        let tracks = albumSections[indexPath.section].albumTracks
        let track = tracks[indexPath.row]
        return MusicCellViewModel(track: track)
    }
}
