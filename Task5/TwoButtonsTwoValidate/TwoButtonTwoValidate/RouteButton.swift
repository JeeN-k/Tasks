//
//  RouteButton.swift
//  TwoButtonTwoValidate
//
//  Created by Oleg Stepanov on 05.03.2022.
//

import Foundation
import UIKit

class RouteButton: UIButton {
    
    init(text: String) {
        super.init(frame: .zero)
        self.setTitle(text, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(.lightText, for: .highlighted)
        self.backgroundColor = .systemBlue
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
