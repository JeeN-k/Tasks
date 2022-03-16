//
//  HeaderView.swift
//  HomeWorkTask7
//
//  Created by Oleg Stepanov on 14.03.2022.
//

import Foundation
import UIKit

protocol ExpandbleHeaderView: AnyObject {
    func expandSection(header: HeaderView, section: Int)
}

final class HeaderView: UITableViewHeaderFooterView {
 
    private lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var albumImage: WebImageView = {
        let imageView = WebImageView()
        let image = UIImage(named: "explicit")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.systemGray.cgColor
        return imageView
    }()
    
    lazy var nameAlbumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 3
        label.text = "Album name"
        return label
    }()
    
    lazy var expandButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(systemName: "chevron.down")?.withRenderingMode(.alwaysOriginal)
        button.setImage(buttonImage, for: .normal)
        button.addTarget(self, action: #selector(expandSection), for: .touchUpInside)
        return button
    }()
    
    var delegate: ExpandbleHeaderView?
    var section: Int?
    
    var isExpanded = false {
        didSet {
            UIView.animate(withDuration: 0.25) {
                if !self.isExpanded {
                    self.expandButton.transform = CGAffineTransform.identity
                } else {
                    self.expandButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                }
            }
        }
    }
    
    func setupHeader(album: Album, section: Int, delegate: ExpandbleHeaderView) {
        nameAlbumLabel.text = album.title
        albumImage.set(imageURL: album.coverMedium)
        self.delegate = delegate
        self.section = section
    }
    
    
    @objc
    private func expandSection() {
        guard let section = section, let delegate = delegate else { return }
        isExpanded = !isExpanded
        delegate.expandSection(header: self, section: section)
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView {
    private func configureConstraints() {
        addSubview(cardView)
        cardView.addSubview(albumImage)
        cardView.addSubview(nameAlbumLabel)
        cardView.addSubview(expandButton)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            albumImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 5),
            albumImage.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5),
            albumImage.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -5),
            albumImage.widthAnchor.constraint(equalToConstant: 80),
            albumImage.heightAnchor.constraint(lessThanOrEqualToConstant: 80),
            
            expandButton.centerYAnchor.constraint(equalTo: albumImage.centerYAnchor),
            expandButton.heightAnchor.constraint(equalToConstant: 40),
            expandButton.widthAnchor.constraint(equalToConstant: 40),
            expandButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -30),
            
            nameAlbumLabel.centerYAnchor.constraint(equalTo: albumImage.centerYAnchor),
            nameAlbumLabel.leadingAnchor.constraint(equalTo: albumImage.trailingAnchor, constant: 5),
            nameAlbumLabel.trailingAnchor.constraint(equalTo: expandButton.leadingAnchor, constant: -10)
        ])
    }
}
