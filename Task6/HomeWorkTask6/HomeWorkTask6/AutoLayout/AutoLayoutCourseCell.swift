//
//  CourseCell.swift
//  HomeWorkTask6
//
//  Created by Oleg Stepanov on 11.03.2022.
//

import Foundation
import UIKit

final class AutoLayoutCourseCell: UITableViewCell {
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowOffset = CGSize(width: 2, height: 4)
        view.layer.shadowColor = UIColor.systemGray.cgColor
        view.layer.shadowOpacity = 0.5
        return view
    }()
    
    private lazy var stockButton: UIButton = {
        let button = UIButton()
        let configuration = UIButton.Configuration.plain()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.setTitleColor(.systemGray, for: .normal)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = configuration
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.systemGray, for: .normal)
        button.setTitle("Подробнее", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .systemBlue
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToNavigation), for: .touchUpInside)
        return button
    }()
    
    var delegate: NavigationDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureCell()
    }
    
    func setupFields(course: Course) {
        stockButton.setTitle(course.stock, for: .normal)
        nameLabel.text = course.name
        priceLabel.text = course.price
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AutoLayoutCourseCell {
    private func configureCell() {
        backgroundColor = .secondarySystemBackground
        
        contentView.addSubview(cardView)
        cardView.addSubview(stockButton)
        cardView.addSubview(nameLabel)
        cardView.addSubview(moreButton)
        cardView.addSubview(priceLabel)
        cardView.addSubview(addButton)
        
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            stockButton.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            stockButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            stockButton.trailingAnchor.constraint(lessThanOrEqualTo: cardView.trailingAnchor, constant: -20),
            
            nameLabel.topAnchor.constraint(equalTo: stockButton.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            moreButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            moreButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            moreButton.trailingAnchor.constraint(lessThanOrEqualTo: cardView.trailingAnchor, constant: -20),
            
            priceLabel.topAnchor.constraint(equalTo: moreButton.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            priceLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
            
            addButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            addButton.bottomAnchor.constraint(lessThanOrEqualTo: cardView.bottomAnchor, constant: -10),
            addButton.topAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -10),
            addButton.widthAnchor.constraint(equalToConstant: 80),
            addButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc
    private func goToNavigation() {
        guard let delegate = delegate else { return }
        delegate.addButtonTapped()
    }
    
    @objc
    private func moreButtonTapped() {
        guard let delegate = delegate else { return }
        delegate.moreButtonTapped()
    }
}
