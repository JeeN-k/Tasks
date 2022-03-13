//
//  ManualCourseCell.swift
//  HomeWorkTask6
//
//  Created by Oleg Stepanov on 12.03.2022.
//

import Foundation
import UIKit

final class ManualCourseCell: UITableViewCell {
    
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
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var viewModel: CellViewModel? {
        willSet(viewModel) {
            setupFields(viewModel: viewModel)
        }
    }
    var delegate: NavigationDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureCell()
    }
    
    func setupFields(viewModel: CellViewModel?) {
        guard let viewModel = viewModel else {
            return
        }
        stockButton.setTitle(viewModel.course.stock, for: .normal)
        nameLabel.text = viewModel.course.name
        priceLabel.text = viewModel.course.price
        configureFrames(viewHeight: CGFloat(viewModel.height))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ManualCourseCell {
    private func configureCell() {
        backgroundColor = .secondarySystemBackground
        
        contentView.addSubview(cardView)
        cardView.addSubview(stockButton)
        cardView.addSubview(nameLabel)
        cardView.addSubview(moreButton)
        cardView.addSubview(priceLabel)
        cardView.addSubview(addButton)
    }
    
    private func configureFrames(viewHeight: CGFloat) {
        let viewWidth = UIScreen.main.bounds.width - 40
        cardView.frame = CGRect(x: 20, y: 10, width: viewWidth, height: viewHeight - 10)
        
        let sizeOfStockButton = stockButton.sizeThatFits(CGSize(width: viewWidth, height: 100))
        stockButton.frame = CGRect(x: 20, y: 10, width: sizeOfStockButton.width, height: 35)
        
        let sizeOfNameLabel = nameLabel.sizeThatFits(CGSize(width: viewWidth, height: 200))
        nameLabel.frame = CGRect(x: 20, y: stockButton.frame.maxY + 10, width: viewWidth - 40, height: sizeOfNameLabel.height)
        
        let sizeOfMoreButton = moreButton.sizeThatFits(CGSize(width: viewWidth, height: 20))
        moreButton.frame = CGRect(x: 20, y: nameLabel.frame.maxY + 5, width: sizeOfMoreButton.width, height: 16)
        priceLabel.frame = CGRect(x: 20, y: moreButton.frame.maxY + 20, width: 150, height: 30)
        addButton.frame = CGRect(x: viewWidth - 100, y: moreButton.frame.maxY + 10, width: 80, height: 40)
    }
    
    @objc
    private func addButtonTapped() {
        guard let delegate = delegate else { return }
        delegate.addButtonTapped()
    }
    
    @objc
    private func moreButtonTapped() {
        guard let delegate = delegate else { return }
        delegate.moreButtonTapped()
    }
}
