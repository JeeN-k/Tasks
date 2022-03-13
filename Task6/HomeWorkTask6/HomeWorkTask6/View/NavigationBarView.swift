//
//  NavigationBarView.swift
//  HomeWorkTask6
//
//  Created by Oleg Stepanov on 13.03.2022.
//

import Foundation
import UIKit

class navigationBarView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        configureView()
        
    }
    
    private func configureView() {
        var image = UIImage(named: "navBarIcon")
        image = image?.withRenderingMode(.alwaysOriginal)
        let imageView = UIImageView(image: image)
        let titleLabel = UILabel()
        titleLabel.text = "Курсы IT"
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        titleLabel.frame = CGRect(x: imageView.frame.maxX + 10, y: 7, width: 100, height: 25)
        addSubview(imageView)
        addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
