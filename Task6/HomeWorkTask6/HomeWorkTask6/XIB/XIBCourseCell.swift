//
//  CourseCustomXIBCell.swift
//  HomeWorkTask6
//
//  Created by Oleg Stepanov on 12.03.2022.
//

import UIKit

class XIBCourseCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var stockButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    
    var delegate: NavigationDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    func setupField(course: Course) {
        stockButton.setTitle(course.stock, for: .normal)
        nameLabel.text = course.name
        priceLabel.text = course.price
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let delegate = delegate else { return }
        delegate.addButtonTapped()
    }
    @IBAction func moreButtonTapped(_ sender: Any) {
        guard let delegate = delegate else { return }
        delegate.moreButtonTapped()
    }
}

extension XIBCourseCell {
    
    private func configureCell() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        
        stockButton.layer.cornerRadius = 15
        stockButton.layer.borderWidth = 1
        stockButton.layer.borderColor = UIColor.systemGray.cgColor
        
        self.layer.masksToBounds = true
        cardView.layer.masksToBounds = false
        cardView.layer.cornerRadius = 8
        cardView.layer.shadowOffset = CGSize(width: 2, height: 4)
        cardView.layer.shadowColor = UIColor.systemGray.cgColor
        cardView.layer.shadowOpacity = 0.5
        
        addButton.layer.cornerRadius = 8
    }
}
