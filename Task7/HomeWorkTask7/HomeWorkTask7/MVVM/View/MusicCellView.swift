//
//  MusicCellView.swift
//  HomeWorkTask7
//
//  Created by Oleg Stepanov on 14.03.2022.
//

import Foundation
import UIKit

final class MusicCellView: UITableViewCell {
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private lazy var artistNameLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Eminem"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Not Afraid"
        return label
    }()
    
    private lazy var rankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        label.text = "№1"
        return label
    }()
    
    private lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2:30"
        return label
    }()
    
    private lazy var explicitImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "explicit")
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var viewModel: MusicCellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            artistNameLable.text = viewModel.track.artist.name
            trackNameLabel.text = viewModel.track.title
            rankLabel.text = "Rank: \(viewModel.track.rank)"
            durationLabel.text = secondsToMinutesSeconds(viewModel.track.duration)
            if viewModel.track.explicitLyrics {
                explicitImageView.isHidden = false
            } else {
                explicitImageView.isHidden = true
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension MusicCellView {
    
    private func secondsToMinutesSeconds(_ seconds: Int) -> String {
        let minutes = String((seconds % 3600) / 60)
        let seconds = (seconds % 3600) % 60
        let strSeconds = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        return "\(minutes):\(strSeconds)"
    }
    
    private func configureCell() {
        backgroundColor = .secondarySystemBackground
        selectionStyle = .none
        
        contentView.addSubview(cardView)
        cardView.addSubview(artistNameLable)
        cardView.addSubview(trackNameLabel)
        cardView.addSubview(rankLabel)
        cardView.addSubview(durationLabel)
        cardView.addSubview(explicitImageView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            durationLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            durationLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            durationLabel.widthAnchor.constraint(equalToConstant: 50),
            
            trackNameLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            trackNameLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            trackNameLabel.trailingAnchor.constraint(equalTo: durationLabel.leadingAnchor, constant: -10),
            
            artistNameLable.topAnchor.constraint(equalTo: trackNameLabel.bottomAnchor, constant: 5),
            artistNameLable.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            artistNameLable.trailingAnchor.constraint(lessThanOrEqualTo: durationLabel.trailingAnchor, constant: -10),
            
            rankLabel.topAnchor.constraint(equalTo: artistNameLable.bottomAnchor, constant: 5),
            rankLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            rankLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            rankLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10),
            
            explicitImageView.topAnchor.constraint(equalTo: artistNameLable.topAnchor),
            explicitImageView.leadingAnchor.constraint(equalTo: artistNameLable.trailingAnchor, constant: 5),
            explicitImageView.bottomAnchor.constraint(equalTo: artistNameLable.bottomAnchor),
            explicitImageView.widthAnchor.constraint(equalToConstant: 20),
            explicitImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 20),
        ])
    }
}
